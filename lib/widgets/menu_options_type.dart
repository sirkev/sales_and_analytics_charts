import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../utils/styles.dart';

class PopUpMenuType extends StatefulWidget {
  const PopUpMenuType(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<PopUpMenuType> createState() => _PopUpMenuTypeState();
}

class _PopUpMenuTypeState extends State<PopUpMenuType> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.isSelected
                      ? Styles.blueColor
                      : Styles.blueColor.withOpacity(0.5),
                  fontSize: Dimensions.getHeight(16),
                  fontWeight:
                      widget.isSelected ? FontWeight.w700 : FontWeight.w400)),
          Icon(
              widget.isSelected
                  ? Icons.radio_button_on_outlined
                  : Icons.radio_button_off_outlined,
              color: widget.isSelected ? Styles.blueColor : Colors.grey[500],
              size: Dimensions.getHeight(20))
        ],
      ),
    );
  }
}
