import 'package:flutter/material.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  const Custom_AppBar({super.key, this.backgroundcolor});
  final Color? backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundcolor ?? Colors.black,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
