import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/pages/auth/signin_screen.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/pages/components/custom_text_field.dart';
import 'package:quitandaapp/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  CustomAppBar appBar() => CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
                onPressed: () {
                  const SigInScreean();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: CustomColors.customCardColor,
                  size: 30,
                )),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    late TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController cpfController = TextEditingController();

    nameController.text = app_data.user.name;
    emailController.text = app_data.user.email;
    phoneController.text = app_data.user.celular;
    cpfController.text = app_data.user.cpf;

    return Scaffold(
      appBar: appBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(13, 32, 16, 16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sua conta',
                  style: TextStyle(
                    color: CustomColors.customSwatchColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  initialValue: app_data.user.name,
                  textoHint: "Nome",
                  textoLabel: "Nome",
                  iconPrefixo: const Icon(Icons.account_box_outlined),
                  controller: nameController,
                  ehEditavel: false,
                ),
                CustomTextField(
                  textoHint: "Celular",
                  textoLabel: "Celular",
                  iconPrefixo: const Icon(Icons.phone),
                  controller: phoneController,
                  ehEditavel: false,
                ),
                CustomTextField(
                  textoHint: "CPF",
                  textoLabel: "CPF",
                  iconPrefixo: const Icon(Icons.file_copy),
                  controller: cpfController,
                  ehEditavel: false,
                ),
                CustomTextField(
                  textoHint: "E-mail",
                  textoLabel: "e-mail",
                  iconPrefixo: const Icon(Icons.email_outlined),
                  controller: emailController,
                  ehEditavel: false,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: CustomColors.customSwatchColor,
                  ),
                  onPressed: () {
                    mostrarDialogoAlterarSenha();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.key_outlined,
                        color: CustomColors.customCardColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Alterar Senha',
                        style: TextStyle(
                          fontSize: 20,
                          color: CustomColors.customCardColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> mostrarDialogoAlterarSenha() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 16,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Alterar Senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                CustomTextField(
                  textoHint: 'Senha atual',
                  textoLabel: 'Senha atual',
                  iconPrefixo: Icon(
                    Icons.key,
                    color: CustomColors.customDarkColor,
                  ),
                  ehSecreto: true,
                ),
                CustomTextField(
                  textoHint: 'Nova Senha',
                  textoLabel: 'Nova Senha',
                  iconPrefixo: Icon(
                    Icons.key_off,
                    color: CustomColors.customDarkColor,
                  ),
                  ehSecreto: true,
                ),
                CustomTextField(
                  textoHint: 'Confirme Nova Senha',
                  textoLabel: 'Confirme Nova Senha',
                  iconPrefixo: Icon(
                    Icons.key_off,
                    color: CustomColors.customDarkColor,
                  ),
                  ehSecreto: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Alterar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customCardColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
