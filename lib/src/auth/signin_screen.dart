import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitandaapp/src/auth/components/custom_app_bar.dart';
import 'package:quitandaapp/src/auth/components/custom_text_field.dart';
import 'package:quitandaapp/src/auth/components/text_animation.dart';
import 'package:quitandaapp/src/auth/signup_screen.dart';
import 'package:quitandaapp/src/base/base_screen.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class SigInScreean extends StatelessWidget {
  const SigInScreean({super.key});

  CustomAppBar appBar() => const CustomAppBar(
        actions: [],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      // App Bar
      appBar: appBar(),
      // Body Section
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 60,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextAnimation(textList: obterpromocoes()),
                    //getListaPromocoes(),
                    const SizedBox(
                      height: 60,
                    ),
                    Image.asset('assets/images/hortifruti_128_128.png'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const CustomTextField(
                      textoHint: 'Informe seu E-mail',
                      textoLabel: 'E-mail',
                      iconPrefixo: Icon(Icons.email),
                    ),
                    const CustomTextField(
                      textoHint: 'Informe sua senha',
                      textoLabel: 'Senha',
                      iconPrefixo: Icon(Icons.lock),
                      ehSecreto: true,
                    ),
                    // Botao Entrar
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BaseScreen(),
                          ));
                        },
                        child: const Text("Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    // Esqueceu a Senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                          ),
                        ),
                      ),
                    ),
                    // Divisor
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black38,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Ou'),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black38,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                        },
                        child: const Text("Criar conta",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> obterpromocoes() {
    return ['Promoção 1', 'Promoção 2', 'Promoção 3'];
  }

  TypewriterAnimatedText obterAnimacaoPromocoes() {
    List<String> promocoes = obterpromocoes();

    try {
      for (var apromocao in promocoes) {
        return TypewriterAnimatedText(
          apromocao,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    } finally {
      if (promocoes.isEmpty) {
        // ignore: control_flow_in_finally
        return TypewriterAnimatedText(
          'Nenhuma promocao',
          textStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }
    throw Exception('Unable to return a valid value');
  }

  AnimatedTextKit getListaPromocoes() {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [obterAnimacaoPromocoes()],
    );
  }
}
