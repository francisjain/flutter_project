import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List View'),
        ),
        body: ListView.separated(
          itemBuilder: (context, int index) => ListTile(
            title: Text('PERSON $index'),
            subtitle: Text('Message $index'),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: const AssetImage('assets/images/Capture.PNG'),
              child: Text('$index'),
            ),
            trailing: Column(
              children: [Text('1$index:00 PM'), Text('1$index:00 AM')],
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 50,
        ));
  }
}
