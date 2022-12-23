import 'package:bloc/bloc.dart';

import 'textbloc_event.dart';
import 'textbloc_state.dart';

class TextblocBloc extends Bloc<TextblocEvent, String> {
  TextblocBloc() : super("") {
    on<InitEvent>((event, emit) {
      emit("");
    },);
    on<getdata>((event, emit) {
      emit("${event.str}");
    },);


  }


}
