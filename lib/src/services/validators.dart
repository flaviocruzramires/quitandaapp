import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? emailEhValido(String? value) {
  if (value == null || value.isEmpty) {
    return 'E-mail obrigatório';
  } else if (!GetUtils.isEmail(value)) {
    return 'E-mail invalido';
  }
  return null;
}

String? nomeEhValido(String? value) {
  if (value == null || value.isEmpty) {
    return 'Nome obrigatorio';
  }
  final names = value.split(' ');
  if (names.length < 2) {
    return 'Nome invalido';
  }

  return null;
}

String? cpfEhValido(String? value) {
  if (value == null || value.isEmpty) {
    return 'CPF obrigatorio';
  } else if (!GetUtils.isCpf(value)) {
    return 'CPF invalido';
  }
  return null;
}

String? telefoneEhValido(String? value) {
  if (value == null || value.isEmpty) {
    return 'Telefone obrigatorio';
  } else if (!GetUtils.isPhoneNumber(value)) {
    return 'Telefone invalido';
  }
  return null;
}

String? passwordEhValido(String? value) {
  if (value == null || value.isEmpty) {
    return 'Senha obrigatória';
  }
  return null;
}
