import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Toast Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toaster'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: const Text('Show Toast'),
              onPressed: () {
                Toast.show(
                  Toast(context: context, message: 'Generic message'),
                );
              },
            ),
            OutlinedButton(
              child: const Text('Info Toast'),
              onPressed: () {
                Toast.info(
                    Toast(context: context, message: 'Information message'));
              },
            ),
            OutlinedButton(
              child: const Text('Warn Toast'),
              onPressed: () {
                Toast.warn(Toast(context: context, message: 'Warning message'));
              },
            ),
            OutlinedButton(
              child: const Text('Error Toast'),
              onPressed: () {
                Toast.error(Toast(context: context, message: 'Error message'));
              },
            ),
            OutlinedButton(
              child: const Text('High Toast'),
              onPressed: () {
                Toast.show(Toast(
                    context: context,
                    message: 'High Toast with Icon',
                    gravity: Toast.TOP,
                    icon: const Icon(Icons.arrow_circle_up)));
              },
            ),
            OutlinedButton(
              child: const Text('Low Toast'),
              onPressed: () {
                Toast.show(
                  Toast(
                    context: context,
                    message: 'Low Toast without Icon',
                    gravity: Toast.BOTTOM,
                  ),
                );
              },
            ),
            OutlinedButton(
              child: const Text('Long Toast'),
              onPressed: () {
                Toast.show(
                  Toast(
                    context: context,
                    message:
                        'High Toast with extra long text message to wrap the widget',
                    gravity: Toast.TOP,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
