import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color colors;
  final VoidCallback onpress;
  const MyButton(
      {super.key,
      required this.title,
      this.colors = const Color(0xff757575),
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: onpress,
          child: Container(
              height: 80,
              decoration: BoxDecoration(shape: BoxShape.circle, color: colors),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ),
      ),
    );
  }
}
