import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quitandaapp/src/auth/components/custom_text_field.dart';

class SigInScreean extends StatelessWidget {
  const SigInScreean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: const Text("Quitanda App"),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
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
                  CustomTextField(
                    textoHint: 'Informe seu E-mail',
                    textoLabel: 'E-mail',
                    iconPrefixo: Icon(Icons.email),
                  ),
                  CustomTextField(
                    textoHint: 'Informe sua senha',
                    textoLabel: 'Senha',
                    iconPrefixo: Icon(Icons.lock),
                    ehSecreto: true,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
