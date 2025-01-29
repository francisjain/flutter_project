import 'package:flutter/material.dart';

class ShowBottomSheetExample extends StatefulWidget {
  const ShowBottomSheetExample({super.key});

  @override
  State<ShowBottomSheetExample> createState() => _ShowBottomSheetExampleState();
}

class _ShowBottomSheetExampleState extends State<ShowBottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('showBottomSheet'),
              onPressed: () {
                showBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showBottomSheet(BuildContext context) async {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 500,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('BottomSheet'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      });
}
