
import 'dart:developer';
import 'dart:isolate';
import '../models/notification_model.dart';


Future<List<NotificationModel>> isolateParseNotifications({
  required Map<String, dynamic> data,
  required int offset,
  required int limit,
}) async {
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _isolateEntryPoint,
    {
      'sendPort': receivePort.sendPort,
      'data': data,
      'offset': offset,
      'limit': limit,
    },
  );

  final result = await receivePort.first;
  if (result is List<NotificationModel>) {
    return result;
  } else {
    throw Exception(result.toString());
  }
}

void _isolateEntryPoint(dynamic message) {
  try {
    final sendPort = message['sendPort'] as SendPort;
    final data = message['data'] as Map<String, dynamic>?;
    final offset = message['offset'] as int;
    final limit = message['limit'] as int;

    if (data == null || !data.containsKey('data')) {
      throw Exception('Invalid or null data received in isolate');
    }

    final List<dynamic> rawList = data['data'] ?? [];
    final parsed = rawList
        .skip(offset)
        .take(limit)
        .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
        .toList();

    sendPort.send(parsed);
  } catch (e, stack) {
    log('message: $e, $stack');
    final sendPort = message['sendPort'] as SendPort;
    sendPort.send('Parsing isolate error: $e');
  }
}