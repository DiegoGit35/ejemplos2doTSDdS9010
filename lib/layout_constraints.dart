import 'package:flutter/material.dart';

class LayoutConstraintsExamplePage extends StatelessWidget {
  const LayoutConstraintsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ejemplo de LayoutBuilder')),
        body: LayoutBuilder(builder: (context, constrains) {
          return Center(
              child: Text(
            constrains.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ));
        }));
  }
}
