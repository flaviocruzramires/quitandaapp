import 'package:get/get.dart';
import 'package:quitandaapp/src/models/usuario_model.dart';

class UsuarioControllerState extends GetxController {
  Rx<Usuario> usuario = Usuario().obs;

  void setNomeUsuario(String nome) {
    usuario.update((value) {
      value?.nome = nome;

      usuario.refresh();
    });
  }

  void setIdadeUsuario(int idade) {
    usuario.update((value) {
      value?.idade = idade;
      usuario.refresh();
    });
  }
}
