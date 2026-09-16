import 'package:app_genius/infrastructure/genius_game.dart';
import 'package:app_genius/presentation/screen/genius_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/game_board.dart';

class GeniusScreen extends StatelessWidget {
  const GeniusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GeniusProvider(
        mode: GameMode.medium,
      ),
      child: const GeniusGamePage(),
    );
  }
}

class GeniusGamePage extends StatefulWidget {
  const GeniusGamePage({super.key});

  @override
  State<GeniusGamePage> createState() =>
      _GeniusGamePageState();
}

class _GeniusGamePageState
    extends State<GeniusGamePage>
    with TickerProviderStateMixin {
  late final List<AnimationController>
      _controllers;

  late final List<Animation<double>>
      _animations;

  late final Listenable _repaintNotifier;

  bool _isSequencePlaying = false;

  @override
  void initState() {
    super.initState();

    final provider =
        context.read<GeniusProvider>();

    _controllers = List.generate(
      provider.colors.length,
      (index) {
        return AnimationController(
          vsync: this,
          duration:
              const Duration(milliseconds: 300),
        );
      },
    );

    _animations = _controllers
        .map(
          (controller) => CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        )
        .toList();

    _repaintNotifier =
        Listenable.merge(_controllers);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  // ================================================
  // PLAY SEQUENCE
  // ================================================

  Future<void> _playSequence(
    List<GeniusColor> sequence,
  ) async {
    if (_isSequencePlaying) {
      return;
    }

    _isSequencePlaying = true;

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    for (final color in sequence) {
      if (!mounted) {
        return;
      }

      final controller =
          _controllers[color.index];

      await controller.forward();

      await controller.reverse();

      await Future.delayed(
        const Duration(milliseconds: 150),
      );
    }

    if (!mounted) {
      return;
    }

    _isSequencePlaying = false;

    context
        .read<GeniusProvider>()
        .finishSequenceDisplay();
  }

  // ================================================
  // PLAYER COLOR ANIMATION
  // ================================================

  void _animateColor(GeniusColor color) {
    final controller =
        _controllers[color.index];

    controller.forward().then((_) {
      if (mounted) {
        controller.reverse();
      }
    });
  }

  // ================================================
  // BUILD
  // ================================================

  @override
  Widget build(BuildContext context) {
    return Consumer<GeniusProvider>(
      builder: (context, genius, child) {
        if (genius.state ==
                GameState.showingSequence &&
            !_isSequencePlaying) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) {
            _playSequence(genius.sequence);
          });
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Pontos: ${genius.score} | '
              'Recorde: ${genius.highScore}',
            ),
          ),

          body: Column(
            children: [
              // ======================================
              // STATUS
              // ======================================

              if (genius.result ==
                  GameResult.lost)
                const Text(
                  'GAME OVER!',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else if (genius.result ==
                  GameResult.won)
                const Text(
                  'VOCÊ GANHOU!',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else if (genius.isPlayingSequence)
                const Text(
                  'Preste atenção!',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                )
              else if (genius.state ==
                  GameState.playerTurn)
                const Text(
                  'Sua vez!',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                  ),
                ),

              const SizedBox(height: 20),

              // ======================================
              // GAME BOARD
              // ======================================

              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(16),
                  child: GameBoard(
                    colors: genius.colors,
                    animations: _animations,
                    score: genius.score,
                    mode: genius.mode,
                    timeProgress:
                        genius.timeProgress,
                    result: genius.result,
                    onColorTap: (color) {
                      genius.handlePlayerInput(
                        color,
                        () => _animateColor(color),
                      );
                    },
                  ),
                ),
              ),

              // ======================================
              // START / RESTART
              // ======================================

              if (genius.state ==
                      GameState.idle ||
                  genius.state ==
                      GameState.gameOver)
                ElevatedButton(
                  onPressed: genius.startGame,
                  child: Text(
                    genius.state ==
                            GameState.gameOver
                        ? 'Tentar Novamente'
                        : 'Iniciar Jogo',
                  ),
                ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}