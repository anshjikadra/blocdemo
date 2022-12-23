import 'package:bloc/bloc.dart';

import 'demo_event.dart';
import 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<DemoState> emit) async {
    emit(state.clone());
  }
}
