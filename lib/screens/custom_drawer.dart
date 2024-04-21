import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:praner_market/controllers/auth_controllers.dart';

class Custom_Drawer extends StatelessWidget {
  Custom_Drawer({super.key});

  final controller = Get.put(Auth_Controller());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                  child: Container(
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: Image.asset("assets/image/logo.png"),
            clipBehavior: Clip.antiAlias,
          ))),
          const SizedBox(height: 10),
          customListtile(
            Icons.home,
            "H O M E",
            () {
              Navigator.pop(context);
            },
          ),
          customListtile(Icons.settings, "S E T T I N G S", () {}),
          customListtile(Icons.logout, "L O G  O U T", () {
            controller.signOut();
          }),
        ],
      ),
    );
  }
}

Widget customListtile(icon, text, ontap) {
  return InkWell(
    onTap: ontap,
    child: ListTile(
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.blueGrey,
          )),
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  );
}
