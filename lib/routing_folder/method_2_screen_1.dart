import 'package:brocode_tutorial_1/routing_folder/method_2_Screen_2.dart';
import 'package:flutter/material.dart';

class MethodTwoRoutOne extends StatelessWidget {
  const MethodTwoRoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView.separated(
      itemBuilder: (context, int index) => ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MethodTwoRoutTwo(
                name: 'Person $index', message: 'Message $index'))),
        title: Text('PERSON $index'),
        subtitle: Text('Message $index'),
        leading: CircleAvatar(
          child: Text('$index'),
          backgroundColor: Colors.green,
          backgroundImage: AssetImage('assets/images/Capture.PNG'),
        ),
        trailing: Column(
          children: [Text('1$index:00 PM'), Text('1$index:00 AM')],
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 50,
    )));
  }
}
