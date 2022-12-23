import 'package:flutter/material.dart';
import 'package:googleads/main.dart';

class second extends StatefulWidget {

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {

    Map m=ModalRoute.of(context)!.settings.arguments as Map;
    // String m=ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Second page")),
      body: Center(
        child: Column(
          children: [
            Text("${m['str']}"),
            Text("${m['value']}"),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, "home");
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return MyApp();
              // },));
            },child: Text("Go to first page"),),
          ],
        ),
      ),
    );
  }
}
