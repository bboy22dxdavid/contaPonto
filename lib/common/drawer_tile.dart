import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
   const DrawerTile({required this.iconData, required this.title, super.key});

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60 ,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Icon(
              iconData,
              size: 32,
              color: Colors.grey,
            ),
          ),
          Text(
            title,
            style: const  TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
