import 'package:flutter/material.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  const Custom_AppBar({super.key, this.backgroundcolor, this.title});
  final Color? backgroundcolor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Profile"),
      backgroundColor: backgroundcolor ?? Colors.black,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,

          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
