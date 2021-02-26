import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import '../criptor.dart';

part 'main_event.dart';
part 'main_state.dart';

class CriptorBloc extends Bloc<CriptorEvent, CriptorState> {
  CriptorBloc() : super(CriptorMainState());

  @override
  Stream<CriptorState> mapEventToState(
    CriptorEvent event,
  ) async* {
    yield LoadingState();
    await Future.delayed(Duration(seconds: 2));
    if (event is CriptIt) {
      var a = getEncriptWord(event.string, event.gamma);
      yield CloseLoadingState();
      yield PopUpState(a.toString());
    }
  }
}
