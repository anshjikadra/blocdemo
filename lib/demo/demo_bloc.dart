import 'package:bloc/bloc.dart';

import 'demo_event.dart';
import 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, int> {

  int t=0;

  DemoBloc() : super(0) {
    on<InitEvent>((event, emit) {

      emit(t);
    },);

    on<decrement>((event, emit) {
      t--;
      print(t);
      emit(t);
    },);

    on<increment>((event, emit) {
      t++;
      print(t);
      emit(t);
    },);

  }


}
