import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/pages/components/custom_text_field.dart';

//import 'ṕackage:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<void> callBackEndPoint() async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, dynamic> body = {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    };

    final dio = Dio();

    Response response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
      options: Options(
        headers: headers,
      ),
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List posts = json.decode(response.data);
      for (var post in posts) {
        print(post['title']);
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    callBackEndPoint();
  }

  CustomAppBar appBar() => const CustomAppBar(
        actions: [],
      );

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  final celularFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
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
              // Topo Body Section
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        // Image Section
                        Image.asset('assets/images/person_128_128.png'),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Informe seu dados abaixo:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customCardColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Formulario Section
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      // Field Section
                      CustomTextField(
                        textoHint: 'Informe seu Nome',
                        textoLabel: 'Nome',
                        iconPrefixo: const Icon(Icons.person),
                      ),
                      CustomTextField(
                        textoHint: 'Informe seu Celular - somente nº',
                        textoLabel: 'Celular',
                        inputFormatters: [celularFormatter],
                        iconPrefixo: const Icon(Icons.phone),
                      ),
                      CustomTextField(
                        textoHint: 'Informe seu CPF - somente nº',
                        textoLabel: 'CPF',
                        inputFormatters: [cpfFormatter],
                        iconPrefixo: const Icon(Icons.file_copy),
                      ),
                      CustomTextField(
                        textoHint: 'Informe seu E-Mail',
                        textoLabel: 'E-Mail',
                        iconPrefixo: const Icon(Icons.email),
                      ),
                      CustomTextField(
                        textoHint: 'Informe sua senha',
                        textoLabel: 'Senha',
                        iconPrefixo: const Icon(Icons.lock),
                        ehSecreto: true,
                      ),
                      // Botao Cadastrar
                      TextButton(
                        onPressed: cadastrar(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              color: CustomColors.customSwatchColor,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cadastrar',
                              style: TextStyle(
                                color: CustomColors.customSwatchColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  cadastrar() {
    // print('Cadastrado');
  }
}
