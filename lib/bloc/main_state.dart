part of 'main_bloc.dart';

@immutable
abstract class CriptorState {}

class CriptorMainState extends CriptorState {}

class LoadingState extends CriptorState {}

class CloseLoadingState extends CriptorState {}

class PopUpState extends CriptorState {
  final String textafter;

  PopUpState(this.textafter);
}
