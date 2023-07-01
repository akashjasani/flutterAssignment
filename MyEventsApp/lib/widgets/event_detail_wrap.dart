import 'package:flutter/material.dart';
class EventDetailWarp extends StatelessWidget {
  final String text;
  final IconData iconData;
  const EventDetailWarp({Key? key, required this.text, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(iconData),
        const SizedBox(width: 10,),
        SizedBox(
            width: 240,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ))
      ],
    );
  }
}
