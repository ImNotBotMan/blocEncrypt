part of 'main_bloc.dart';

@immutable
abstract class CriptorEvent {}

class CriptIt extends CriptorEvent {
  final String string;
  final String gamma;

  CriptIt(this.string, this.gamma);
}

class DecriptIT extends CriptorEvent {
  final String string;
  final int key;
  DecriptIT(
    this.string,
    this.key,
  );
}
