
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flow/flow/features/notifications/data/models/notification_model.dart';

import '../repository/notification_parser.dart';

class NotificationRemoteDataSource {
  final Dio dio;
  NotificationRemoteDataSource({Dio? dio}) : dio = dio ?? Dio();

  Future<List<NotificationModel>> fetchNotifications({
    required int offset,
    required int limit,
  }) async {
    try {
      final response = await dio.get('https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json');

      if (response.statusCode == 200 && response.data != null) {
        final parsedData = response.data is String
            ? json.decode(response.data)
            : response.data;

        if (parsedData is Map<String, dynamic>) {
          final result = await isolateParseNotifications(
            data: parsedData,
            offset: offset,
            limit: limit,
          );
          return result;
        } else {
          throw Exception('Invalid JSON structure');
        }
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      rethrow;
    }
  }
}
