import 'package:contaponto/models/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../helpers/firebase_error.dart';

class UserManager  extends ChangeNotifier{

//carregar o usuario quando abrir o app
  UserManager(){
    _loadCurrentUser();
  }

//intanciando o firebase
  final FirebaseAuth auth = FirebaseAuth.instance;
   User? user;

  //vaiavel de loading
  bool _loading = false;
  bool get loading => _loading;

  /*========================
        funcao de login
   ==========================*/
  Future<void> signIn({required Usuario usuario, required Function onFail, required Function onSucess}) async {
    //setando o loading em true
    loading = true;

    try {

      final UserCredential result  = await auth.signInWithEmailAndPassword(
          email: usuario.email,
          password: usuario.password);
      
      await Future.delayed(const Duration(seconds: 4));
      //printando o usuario logado
      //print('SUCESSO AO LOGAR ${result.user!.uid}');
      user = result.user!;
      onSucess();

    } on FirebaseAuthException catch (e){
      //debugando o cod de erro
      //print('ERRO AO LOGAR${getErrorString(e.code)}');
      onFail(getErrorString(e.code));
    }
    //setando o loading em false
    loading = false;
  }
/*========================
  funcao de carregamento
==========================*/
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  /*===========================================
    funcao para carregar usuario logado
  ===========================================*/
  Future<void> _loadCurrentUser() async{
   final User currentUser = await auth.currentUser!;

   //condicao para verificar se o usuario atual e diferente de nulo
    if(currentUser != null){
      user = currentUser;
      print(user?.uid);
    }
    notifyListeners();

  }
}