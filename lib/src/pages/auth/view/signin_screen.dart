import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/pages/auth/controller/auth_controller.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/pages/components/custom_text_field.dart';
import 'package:quitandaapp/src/pages/components/text_animation.dart';
import 'package:quitandaapp/src/pages/exemplo_get.dart';
import 'package:quitandaapp/src/pages_routes/app_pages.dart';
import 'package:quitandaapp/src/services/utils_services.dart';
import 'package:quitandaapp/src/services/validators.dart';

class SigInScreean extends StatelessWidget {
  SigInScreean({super.key});

  final _formKey = GlobalKey<FormState>();

  CustomAppBar appBar() => const CustomAppBar(
        actions: [],
      );

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          content: Text('Funcionalidade em construção'),
                        ));
                      },
                      child:
                          Image.asset('assets/images/hortifruti_128_128.png'),
                    ),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        textoHint: 'Informe seu E-mail',
                        textoLabel: 'E-mail',
                        iconPrefixo: const Icon(Icons.email),
                        inputType: TextInputType.emailAddress,
                        validator: emailEhValido,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        textoHint: 'Informe sua senha',
                        textoLabel: 'Senha',
                        iconPrefixo: const Icon(Icons.lock),
                        ehSecreto: true,
                        validator: passwordEhValido,
                      ),
                      // Botao Entrar
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: GetX<AuthController>(
                          //init: AuthController(),
                          //initState: (_) {},
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                backgroundColor: Colors.green,
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();

                                      if (_formKey.currentState!.validate()) {
                                        authController.singIn(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                        if (authController.isLogged.value) {
                                          UtilsServices.showSnackbar(
                                            message:
                                                'Usuário logado com sucesso',
                                            isError: false,
                                            context: context,
                                          );
                                        } else {
                                          UtilsServices.showSnackbar(
                                            message:
                                                'E-mail ou senha inválidos',
                                            isError: true,
                                            context: context,
                                          );
                                        }
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text("Entrar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                            );
                          },
                        ),
                      ),
                      // Esqueceu a Senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ExemploGet(),
                            ));
                          },
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
                            Get.offNamed(AppPagesRoutes.signUp);
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

String? valideEmail(String text) {
  if (text.isEmpty) {
    return 'E-mail obrigatorio';
  } else if (!GetUtils.isEmail(text)) {
    return 'E-mail invalido';
  } else {
    return null;
  }
}
