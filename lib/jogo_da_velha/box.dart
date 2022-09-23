import 'package:flutter/material.dart';

import 'controller.dart';

class Box extends StatefulWidget {
  final Function type;
  final Controller controller;
  final int index;
  const Box(
      {required this.type,
      required this.controller,
      super.key,
      required this.index});

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
              if (isShown == null)
                widget.controller.insertValue(widget.index, widget.type()),
            })
      },
      child: ValueListenableBuilder(
        valueListenable: widget.controller.indexGame,
        builder: (context, count, _) {
          var value = widget.controller.getValue(count);
          if (value != null && count == widget.index) {
            isShown = value
                ? Image.asset('images/x.png')
                : Image.asset('images/bola.png');
          }
          return Container(
              width: 50, height: 50, color: Colors.yellow, child: isShown);
        },
      ),
    );
  }
}
