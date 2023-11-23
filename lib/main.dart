import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contaponto/common/page_button.dart';
import 'package:contaponto/login/tela_login.dart';
import 'package:contaponto/models/user_maneger.dart';
import 'package:contaponto/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'base/base_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {

  // INSTRUCAO PARA INICIALIZAR OS PACKAGES
  WidgetsFlutterBinding.ensureInitialized();

  //INICIALIZANDO O FIREBASE
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
//ESCREVENDO NO BANCO DE DADOS
  /*FirebaseFirestore.instance.collection('instalacao').doc('documento').set({
    'ID':'000000',
    'data':'06/10/2023'
  });*/

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
       title: 'Contador de pontos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: const TelaLogin()
        //SplashScree(),
        //PageButton()
        // BaseScreen(),
        //
      ),
    );
  }
}

