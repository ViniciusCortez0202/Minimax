import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  final Function type;
  const Box({required this.type, super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  Widget? isShown;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        setState(() => {
              if (isShown == null) isShown = widget.type(),
            })
      },
      child: Container(
          width: 50, height: 50, color: Colors.yellow, child: isShown),
    );
  }
}
