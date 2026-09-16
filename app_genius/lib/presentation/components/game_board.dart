import 'package:app_genius/infrastructure/genius_game.dart';
import 'package:flutter/material.dart';

import 'color_container.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    super.key,
    required this.colors,
    required this.animations,
    required this.onColorTap,
    required this.score,
    required this.mode,
    required this.timeProgress,
    required this.result,
  });

  final List<GeniusColor> colors;

  final List<Animation<double>> animations;

  final ValueChanged<GeniusColor> onColorTap;

  final int score;

  final GameMode mode;

  final double timeProgress;

  final GameResult result;

  @override
  Widget build(BuildContext context) {
    Color? feedbackColor;

    if (result == GameResult.won) {
      feedbackColor = Colors.green;
    }

    if (result == GameResult.lost) {
      feedbackColor = Colors.red;
    }

    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final radius =
              constraints.maxWidth / 2;

          return Stack(
            children: [
              // ========================================
              // TABULEIRO
              // ========================================

              Column(
                children: [
                  // ------------------------------------
                  // LINHA SUPERIOR
                  // ------------------------------------

                  Expanded(
                    child: Row(
                      children: [
                        ColorContainer(
                          color: colors[0].color,
                          overrideColor: feedbackColor,
                          animation:
                              animations[colors[0].index],
                          onTap: () =>
                              onColorTap(colors[0]),
                          topLeft: radius,
                        ),

                        ColorContainer(
                          color: colors[1].color,
                          overrideColor: feedbackColor,
                          animation:
                              animations[colors[1].index],
                          onTap: () =>
                              onColorTap(colors[1]),
                          topRight: radius,
                        ),
                      ],
                    ),
                  ),

                  // ------------------------------------
                  // LINHA INFERIOR
                  // ------------------------------------

                  Expanded(
                    child: Row(
                      children: [
                        ColorContainer(
                          color: colors[2].color,
                          overrideColor: feedbackColor,
                          animation:
                              animations[colors[2].index],
                          onTap: () =>
                              onColorTap(colors[2]),
                          bottomLeft: radius,
                        ),

                        ColorContainer(
                          color: colors[3].color,
                          overrideColor: feedbackColor,
                          animation:
                              animations[colors[3].index],
                          onTap: () =>
                              onColorTap(colors[3]),
                          bottomRight: radius,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // ========================================
              // CENTRO
              // ========================================

              Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.30,
                  heightFactor: 0.30,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // ==================================
                      // TIMER
                      // ==================================

                      if (mode.hasTimer)
                        Positioned.fill(
                          child: CircularProgressIndicator(
                            value: timeProgress,
                            strokeWidth: 8,
                            backgroundColor:
                                Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withOpacity(0.4),
                          ),
                        ),

                      // ==================================
                      // SCORE
                      // ==================================

                      FractionallySizedBox(
                        widthFactor: 0.82,
                        heightFactor: 0.82,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Theme.of(context)
                                    .colorScheme
                                    .surface,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.25),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$score',
                            style:
                                Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}