import 'package:quitandaapp/src/models/validator_model.dart';

abstract class ValidatorServices {
  Future<ValidatorModel> nomeEhValido(ValidatorModel objetoValidator);

  static Future<ValidatorModel?> emailEhValido(
      ValidatorModel objetoValidator) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        if (objetoValidator.text!.isEmpty) {
          return ValidatorModel(
            isValid: false,
            errorText: 'Email não pode estar vazio',
            typeValidation: 'email',
            text: 'Email Válido',
          );
        } else if (!objetoValidator.text!.contains('@')) {
          return ValidatorModel(
            isValid: false,
            errorText: 'Email inválido',
            typeValidation: 'email',
            text: 'Email Válido',
          );
        } else if (objetoValidator.text!.length < 5) {
          return ValidatorModel(
            isValid: false,
            errorText: 'Email muito curto',
            typeValidation: 'email',
            text: 'Email Válido',
          );
        } else {
          return ValidatorModel(isValid: true, text: 'Email Válido');
        }
      },
    );
    return null;
  }
}
