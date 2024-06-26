import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  final String textoHint;
  final String textoLabel;
  final Icon iconPrefixo;
  TextEditingController? controller;
  final String? initialValue;
  final bool ehSecreto;
  final List<TextInputFormatter>? inputFormatters;
  final bool ehEditavel;
  TextInputType? inputType;
  final String? Function(String?)? validator;

  CustomTextField(
      {super.key,
      required this.textoHint,
      required this.textoLabel,
      required this.iconPrefixo,
      this.ehSecreto = false,
      this.inputFormatters,
      this.controller,
      this.initialValue,
      this.ehEditavel = true,
      this.inputType = TextInputType.text,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool ehOculto = false;

  @override
  void initState() {
    super.initState();
    ehOculto = widget.ehSecreto;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: widget.validator,
        keyboardType: widget.inputType,
        enabled: widget.ehEditavel,
        controller: widget.controller,
        obscureText: ehOculto,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          suffixIcon: widget.ehSecreto
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      ehOculto = !ehOculto;
                    });
                  },
                  icon: Icon(
                    ehOculto ? Icons.visibility : Icons.visibility_off,
                    color: CustomColors.customDarkColor,
                  ),
                )
              : null,
          prefixIcon: widget.iconPrefixo,
          isDense: true,
          hintText: widget.textoHint,
          labelText: widget.textoLabel,
          labelStyle: TextStyle(
            color: CustomColors.customDarkColor,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.customSwatchColor,
            ),
          ),
        ),
      ),
    );
  }
}
