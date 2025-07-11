part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent {}
final class CheckConnectivity extends NetworkEvent {}
