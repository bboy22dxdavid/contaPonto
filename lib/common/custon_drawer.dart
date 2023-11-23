import 'package:contaponto/common/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child:ListView(
        children: const[
          DrawerTile(iconData: Icons.home, title: 'Inicio'),
          DrawerTile(iconData: Icons.add_circle_outline, title: 'Adicionar'),
          DrawerTile(iconData: Icons.library_books_sharp, title: 'Listar'),
        ],
      ),
    );
  }
}
