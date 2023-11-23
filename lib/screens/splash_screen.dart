import 'package:flutter/material.dart';
import '../common/page_button.dart';


class SplashScree extends StatelessWidget {
  const SplashScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: 500,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'image/fundo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  width: 500,
                  height: 80,
                  child: const Center(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'SEJA BEM VINDO!\nAO NOSSO CONTADOR DE PONTOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22, fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  width: 500,
                  height: 100,
                  child: const Center(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Este e um aplicativo especifico para registrar e calcular, '
                            'a media depontuação, realizada o decorre no dia a dia.'
                            ' Entre instalações e visitas tecnicas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14, fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: 500,
                  height: 80,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        //Todo add condicao para ir para a home ou para cadatro
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context)=>
                            const PageButton()),
                        );
                      },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      child: const Text(
                        'Vamos Começar',
                        style:  TextStyle(fontSize: 40),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ],
        ),
    );
  }
}


/*
EasySplashScreen(
      logo: Image.network(
          'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
      title: const Text(
        "Seja bem vindo!"
            "Ao Nosso COntador de Pontos!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: HomePage(),
      durationInSeconds: 5,
    );
 */

