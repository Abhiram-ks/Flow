part of 'network_bloc.dart';

@immutable
sealed class NetworkState {}

final class NetworkInitial extends NetworkState {}
final class NetworkGood extends NetworkState {}
final class NetworkBad  extends NetworkState {
  final String error;

  NetworkBad({required this.error});
}
