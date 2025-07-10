part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

final class SplashInitial extends SplashState {}
final class SplashLoading extends SplashState {}
final class GoToNavigate  extends SplashState {}
final class SplashFailure extends SplashState {
  final String error;
  SplashFailure({required this.error});
}
