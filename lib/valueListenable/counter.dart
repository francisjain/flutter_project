import 'package:flutter/material.dart';

class UpdateDOMWithoutState extends StatelessWidget {
  ValueNotifier<int> _count = ValueNotifier(0);
  void _increament() {
    _count.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update DOM without State'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: _count,
            builder: (BuildContext context, int value, Widget? child) {
              return Center(
                child: Text('Value: $value'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _increament,
      ),
    );
  }
}
