import 'package:flutter/material.dart';
import '../common/custon_drawer.dart';

class BaseScreen extends StatelessWidget {
   BaseScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home'),
          ),
        ),
        Container(color: Colors.blue,),
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
      ],
    );
  }
}
