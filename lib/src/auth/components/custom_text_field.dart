import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatefulWidget {
  final String textoHint;
  final String textoLabel;
  final Icon iconPrefixo;

  final bool ehSecreto;

  const CustomTextField({
    super.key,
    required this.textoHint,
    required this.textoLabel,
    required this.iconPrefixo,
    this.ehSecreto = false,
  });

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
        obscureText: ehOculto,
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
                    color: Colors.black54,
                  ),
                )
              : null,
          prefixIcon: widget.iconPrefixo,
          isDense: true,
          hintText: widget.textoHint,
          labelText: widget.textoLabel,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.black26,
            ),
          ),
        ),
      ),
    );
  }
}
