import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'demo_bloc.dart';
import 'demo_event.dart';
import 'demo_state.dart';
//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
class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DemoBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<DemoBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {

            bloc.add(decrement());

          }, child: Text("-")),
          BlocBuilder<DemoBloc,int>(builder: (context, state) {
            return Text("$state");
          },),
          ElevatedButton(onPressed: () {

            bloc.add(increment());

          }, child: Text("+"))
        ],
      ),
    );
  }
}

