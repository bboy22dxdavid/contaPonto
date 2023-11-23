import 'package:flutter/material.dart';
import '../pages/page_cadastrar.dart';
import '../pages/page_inicio.dart';
import '../pages/page_listar.dart';

class PageButton extends StatefulWidget {
    const PageButton({super.key});
  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {

  int _indiceAtual = 0;
  final List<Widget> _telas = [
     const PageInicio(),
    const PageLIstar(),
    const PageCadastrar()
  ];

  Color get primaryColor => Theme.of(context).primaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              //colocando cor no butao
              //color: _indiceAtual == 1 ? primaryColor : Colors.grey
              label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Lista'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_task),
              label: 'Cadastrar'
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;

      //printando a pagina atual ao clicar
      //debugPrint('cliquei $_indiceAtual');
    });
  }
}


