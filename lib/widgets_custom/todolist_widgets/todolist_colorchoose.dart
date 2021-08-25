import 'package:flutter/material.dart';

import 'package:to_do_list/constans/todolist_constans.dart';

class ColorChooseDialog extends StatefulWidget {
  const ColorChooseDialog({Key? key}) : super(key: key);

  @override
  _ColorChooseDialogState createState() => _ColorChooseDialogState();
}

class _ColorChooseDialogState extends State<ColorChooseDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        ColorChoose(color: color1),
        ColorChoose(color: color2),
        ColorChoose(color: color3),
        ColorChoose(color: color4),
        ColorChoose(color: color5),
        ColorChoose(color: color6),
        ColorChoose(color: color7),
        ColorChoose(color: color8),
        ColorChoose(color: color9),
        ColorChoose(color: color10),
        ColorChoose(color: color11),
        ColorChoose(color: color12),
      ]),
    );
  }
}

class ColorChoose extends StatefulWidget {
  final Color? color;
  ColorChoose({Key? key, required this.color}) : super(key: key);

  @override
  _ColorChooseState createState() => _ColorChooseState(this.color);
}

class _ColorChooseState extends State<ColorChoose> {
  final Color? color;
  _ColorChooseState(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      height: colorHeightContainer,
      width: colorWidthContainer,
      child: InkWell(
        onTap: () {
          setState(() {
            colorInput = color.toString();
          });
        },
      ),
    );
  }
}
