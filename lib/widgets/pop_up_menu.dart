import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({Key? key, required this.menuList, this.icon})
      : super(key: key);
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        iconSize: 45,
        icon: widget.icon,
        itemBuilder: (context) {
          return widget.menuList;
        });
  }
}
