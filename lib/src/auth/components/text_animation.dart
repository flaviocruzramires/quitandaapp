import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextAnimation extends StatefulWidget {
  final List<String> textList;

  const TextAnimation({super.key, required this.textList});

  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _textIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000), // Duração da animação
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Quando a animação é concluída, avançamos para o próximo texto
        setState(() {
          if (_textIndex <= widget.textList.length) {
            _textIndex++;
          } else {
            _textIndex = 0;
          }
          //_textIndex = (_textIndex + 1) % widget.textList.length;
        });
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        // Quando a animação é interrompida, reiniciamos o texto
        _textIndex = 0;
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          //repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              widget.textList[_textIndex],
              textStyle: const TextStyle(
                fontSize: 18.0, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Peso da fonte
              ),
            ),
          ],
        )
      ],
    );

    /*
    return TypewriterAnimatedTextKit(
      isRepeatingAnimation: false, // Para animação não ser repetida
      totalRepeatCount:
          1, // Para garantir que a animação seja reproduzida apenas uma vez
      speed: Duration(milliseconds: 50), // Velocidade da animação
      onFinished: () {
        // Quando a animação é concluída
        // Você pode adicionar qualquer lógica adicional aqui, se necessário
      },
      text: [widget.textList[_textIndex]],
      textStyle: TextStyle(
        fontSize: 24.0, // Tamanho da fonte
        fontWeight: FontWeight.bold, // Peso da fonte
      ),
      textAlign: TextAlign.center, // Alinhamento do texto
      alignment: Alignment.center, // Alinhamento do widget de animação
    );*/
  }
}
