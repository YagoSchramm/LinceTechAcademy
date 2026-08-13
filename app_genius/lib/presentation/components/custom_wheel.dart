import 'dart:math' as math;

import 'package:flutter/material.dart';
class GeniusWheelWidget extends StatelessWidget {
  final List<Color> colors; // Apenas a lista de cores!
  final List<Animation<double>> animations;
  final Listenable repaint;
  final Function(int index) onButtonTap;

  const GeniusWheelWidget({
    super.key,
    required this.colors,
    required this.animations,
    required this.repaint,
    required this.onButtonTap,
  });

  // Descobre a quantidade de botões a partir da lista
  int get numberOfButtons => colors.length;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTapUp: (details) {
          final renderBox = context.findRenderObject() as RenderBox;
          final localPosition = details.localPosition;
          final size = renderBox.size;
          
          final center = Offset(size.width / 2, size.height / 2);
          final dx = localPosition.dx - center.dx;
          final dy = localPosition.dy - center.dy;

          double angle = math.atan2(dy, dx);
          angle = (angle + math.pi / 2) % (2 * math.pi);
          if (angle < 0) angle += 2 * math.pi;

          final sweepAngle = (2 * math.pi) / numberOfButtons;
          int clickedIndex = (angle / sweepAngle).floor();

          if (clickedIndex >= 0 && clickedIndex < numberOfButtons) {
            onButtonTap(clickedIndex);
          }
        },
        child: CustomPaint(
          size: Size.infinite,
          painter: GeniusWheelPainter(
            numberOfButtons: numberOfButtons,
            colors: colors,
            animations: animations,
            repaint: repaint,
          ),
        ),
      ),
    );
  }
}
class GeniusWheelPainter extends CustomPainter {
  final int numberOfButtons;
  final List<Color> colors;
  final List<Animation<double>> animations;

  GeniusWheelPainter({
    required this.numberOfButtons,
    required this.colors,
    required this.animations,
    required Listenable repaint,
  }) : super(repaint: repaint); // <--- O Flutter redesenha a tela automaticamente quando o repaint muda!

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * 0.45;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweepAngle = (2 * math.pi) / numberOfButtons;

    for (int i = 0; i < numberOfButtons; i++) {
      final startAngle = (i * sweepAngle) - (math.pi / 2);
      
      // Pega o progresso da animação do botão 'i' (0.0 = desligado, 1.0 = aceso no máximo)
      final animValue = animations[i].value;

      // Opacidade base vai de 0.25 (apagado) até 1.0 (aceso brilhante)
      final opacity = 0.25 + (0.75 * animValue);

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = colors[i % colors.length].withOpacity(opacity);

      // 1. Desenha o arco preenchido
      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

      // 2. EFEITO DE BRILHO (GLOW): Se o botão estiver acendendo, desenha uma borda brilhante
      if (animValue > 0.05) {
        final glowPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3 + (8 * animValue) // Borda engrossa conforme acende
          ..color = Colors.white.withOpacity(0.8 * animValue);
        
        canvas.drawArc(rect, startAngle, sweepAngle, true, glowPaint);
      }

      // 3. Linha preta separadora das fatias
      final borderPaint = Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black
        ..strokeWidth = 4;
      
      canvas.drawArc(rect, startAngle, sweepAngle, true, borderPaint);
    }

    // Centro preto estilo Genius
    canvas.drawCircle(center, radius * 0.35, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant GeniusWheelPainter oldDelegate) => true;
}