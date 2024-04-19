import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile_Listtile extends StatelessWidget {
  final String title;
  final String subtitle;
  const Profile_Listtile(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          border: Border.all(color: Colors.white38),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
