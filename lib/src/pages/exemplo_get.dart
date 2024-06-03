import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quitandaapp/src/pages/components/custom_text_field.dart';
import 'package:quitandaapp/src/pages/usuario_controller_state.dart';
import 'package:quitandaapp/src/pages/value_controller.dart';

class ExemploGet extends StatelessWidget {
  ExemploGet({super.key});

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  final valueController = ValueController();

  final UsuarioControllerState usuarioController = UsuarioControllerState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () {
                return Column(
                  children: [
                    CustomTextField(
                      textoHint: 'Nome',
                      textoLabel:
                          'Nome : ${usuarioController.usuario.value.nome}',
                      iconPrefixo: const Icon(Icons.person),
                      ehEditavel: false,
                    ),
                    CustomTextField(
                      textoHint: 'Idade',
                      textoLabel:
                          'Idade : ${usuarioController.usuario.value.idade}',
                      iconPrefixo: const Icon(Icons.numbers),
                      ehEditavel: false,
                    ),
                  ],
                );
              },
            ),
            CustomTextField(
              ehEditavel: true,
              ehSecreto: false,
              controller: nomeController,
              iconPrefixo: const Icon(Icons.person),
              textoHint: 'Nome',
              textoLabel: 'Nome',
            ),
            CustomTextField(
              ehEditavel: true,
              ehSecreto: false,
              controller: idadeController,
              iconPrefixo: const Icon(Icons.numbers),
              textoHint: 'Idade',
              textoLabel: 'Idade',
              inputType: TextInputType.number,
            ),
            Obx(
              () {
                return valueController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          usuarioController.setNomeUsuario(nomeController.text);
                          usuarioController
                              .setIdadeUsuario(int.parse(idadeController.text));
                        },
                        child: const Text('Cadastrar'),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
