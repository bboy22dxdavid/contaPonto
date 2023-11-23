import 'package:contaponto/helpers/validators.dart';
import 'package:contaponto/models/user_maneger.dart';
import 'package:contaponto/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: 500,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'image/login.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: formKey,
                      child: Consumer<UserManager>(
                        builder: (_, userManager, child){
                          return ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(16),
                            children: [
                              // E-MAIL
                              TextFormField(
                                controller: emailController,
                                enabled: !userManager.loading,
                                decoration: const InputDecoration(hintText: 'E-mail'),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                validator: (email){
                                  if(!emailValid(email!)) {
                                    return 'E-mail inválido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16,),
                              // SENHA
                              TextFormField(
                                controller: passController,
                                enabled: !userManager.loading,
                                decoration: const InputDecoration(hintText: 'Senha'),
                                autocorrect: false,
                                obscureText: true,
                                validator: (pass){
                                  if(pass!.isEmpty || pass.length < 6) {
                                    return 'Senha inválida';
                                  }
                                  return null;
                                },
                              ),

                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    child: const Text('Esqueci minha Senha'),
                                    onPressed: (){},
                                  )
                              ),

                              SizedBox(
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: userManager.loading ? null :() {
                                    //Todo add condicao para ir para a home ou para cadatro
                                    if(formKey.currentState!.validate()){
                                      //print(emailController.text);
                                      userManager.signIn(
                                          usuario: Usuario(
                                              email: emailController.text,
                                              password: passController.text
                                          ),
                                          // funcao que indica falha ao logar
                                          onFail:(e){
                                            //debugando erro ao logar
                                            //print(e);
                                            //snacbar de error
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Login failed: $e"),
                                                  backgroundColor: Colors.red,)
                                            );
                                          },
                                          // funcao que indica sucesso ao logar
                                          onSucess: (){
                                            //Todo: fechar tela de login e ir para home
                                            //print('Sucesso');
                                          }
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                    backgroundColor: Theme.of(context).primaryColor,
                                    disabledBackgroundColor:Theme.of(context).primaryColor.withAlpha(100)
                                  ),
                                  child: userManager.loading ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                  )
                                      :const Text(
                                    'Entrar',
                                    style:  TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              //=======================
                              //divisao dos botoes
                              //=======================
                              const SizedBox(height: 16,),
                              SizedBox(
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //Todo add condicao para ir para a home ou para cadatro
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                      )
                                  ),
                                  child: const Text(
                                    'Cadastrar',
                                    style:  TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
