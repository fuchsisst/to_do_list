import 'package:flutter/material.dart';

import 'package:to_do_list/constans/todolist_constans.dart';

class IconChoose extends StatefulWidget {
  final String iconString;
  final IconData iconData;
  IconChoose({Key? key, required this.iconString, required this.iconData})
      : super(key: key);

  @override
  _IconChooseState createState() =>
      _IconChooseState(this.iconString, this.iconData);
}

class _IconChooseState extends State<IconChoose> {
  final String iconString;
  final IconData iconData;
  _IconChooseState(this.iconString, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          setState(() {
            iconInput = iconString;
          });
        },
        child: Center(
            child: Icon(
          iconData,
          size: iconsSizeDialog,
          color: Colors.orangeAccent[200],
        )),
      ),
    );
  }
}

class IconChooseDialog extends StatefulWidget {
  const IconChooseDialog({Key? key}) : super(key: key);

  @override
  _IconChooseDialogState createState() => _IconChooseDialogState();
}

class _IconChooseDialogState extends State<IconChooseDialog> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        IconChoose(iconString: 'access_alarm', iconData: Icons.access_alarm),
        IconChoose(iconString: 'brush', iconData: Icons.brush),
        IconChoose(
            iconString: 'pending_actions', iconData: Icons.pending_actions),
        IconChoose(iconString: 'language', iconData: Icons.language),
        IconChoose(
            iconString: 'emoji_transportation',
            iconData: Icons.emoji_transportation),
        IconChoose(iconString: 'translate', iconData: Icons.translate),
        IconChoose(
            iconString: 'emoji_emotions', iconData: Icons.emoji_emotions),
        IconChoose(iconString: 'emoji_events', iconData: Icons.emoji_events),
        IconChoose(
            iconString: 'emoji_food_beverage',
            iconData: Icons.emoji_food_beverage),
        IconChoose(iconString: 'emoji_objects', iconData: Icons.emoji_objects),
        IconChoose(iconString: 'emoji_symbols', iconData: Icons.emoji_symbols),
        IconChoose(iconString: 'local_hotel', iconData: Icons.local_hotel),
      ],
    );
  }
}
