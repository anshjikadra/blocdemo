import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'textbloc_bloc.dart';
import 'textbloc_event.dart';
import 'textbloc_state.dart';

class TextblocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TextblocBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  TextEditingController t1=TextEditingController();

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TextblocBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(controller: t1,),
          ElevatedButton(onPressed: () {
            String str=t1.text;
            bloc.add(getdata(str));
          }, child: Text("Submit")),
          BlocBuilder<TextblocBloc,String>(builder: (context, state) {
            return Text("$state");
          },)
        ],
      ),
    );
  }
}

