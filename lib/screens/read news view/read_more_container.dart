import 'package:flutter/material.dart';

class ReadMoreContainer extends StatelessWidget {
  const ReadMoreContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[800],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Read More',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 16,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white54,
            size: 14,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white38,
            size: 12,
          ),
        ],
      ),
    );
  }
}
