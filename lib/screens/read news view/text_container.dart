import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
   TextContainer({Key? key, required this.summary}) : super(key: key);
  String summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        summary,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
      ),
    );
  }
}
