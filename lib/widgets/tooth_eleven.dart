import 'package:flutter/material.dart';

class ToothEleven extends StatefulWidget {
  @override
  State<ToothEleven> createState() => _ToothElevenState();
}

class _ToothElevenState extends State<ToothEleven> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() => selecionado = !selecionado);
          },
          child: CustomPaint(
            size: Size(80, 120),
            painter: ToothElevenPainter(selecionado),
          ),
        ),
        const SizedBox(height: 4),
        const Text('11', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class ToothElevenPainter extends CustomPainter {
  final bool selecionado;
  ToothElevenPainter(this.selecionado);

  @override
  void paint(Canvas canvas, Size size) {
    final dentePath = Path();
    final width = size.width;
    final height = size.height;

    // Forma mais orgânica para o incisivo central
    dentePath.moveTo(width * 0.5, height * 0.05); // topo
    dentePath.cubicTo(
      width * 0.85, height * 0.15,
      width * 0.8, height * 0.65,
      width * 0.55, height * 0.95,
    ); // lado direito

    dentePath.cubicTo(
      width * 0.45, height * 1.00,
      width * 0.2, height * 0.65,
      width * 0.15, height * 0.15,
    ); // lado esquerdo

    dentePath.close();

    // Sombra leve ao fundo
    canvas.drawShadow(dentePath, Colors.black45, 4.0, true);

    // Preenchimento
    final fillPaint = Paint()
      ..color = selecionado ? const Color(0xFF73D53F) : Colors.white
      ..style = PaintingStyle.fill;

    // Contorno do dente
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawPath(dentePath, fillPaint);
    canvas.drawPath(dentePath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant ToothElevenPainter oldDelegate) =>
      oldDelegate.selecionado != selecionado;
}