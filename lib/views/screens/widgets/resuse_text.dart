import 'package:flutter/material.dart';

class ReuseTextWidget extends StatelessWidget {
  final String title;

  const ReuseTextWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 4),
        ),
      ),
    );
  }
}
