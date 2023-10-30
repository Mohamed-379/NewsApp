import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {
  final String message;

  ErrorView({super.key, required this.message});

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: isVisible,
        child: AlertDialog(
          title: const Text("Error"),
          content: Text(widget.message),
          actions: [
            TextButton(onPressed: (){
              setState(() {
                isVisible = false;
              });
            }, child: const Text("OK"))
          ],
        ),
      ),
    );
  }
}