import 'package:app_genius/presentation/components/custom_wheel.dart';
import 'package:app_genius/presentation/screen/genius_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class GeniusScreen extends StatelessWidget {
  const GeniusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => GeniusProvider(colors: <Color>[Colors.red,Colors.blue,Colors.green,Colors.yellow]),
    child: GeniusGamePage(),
    );
  }
}
class GeniusGamePage extends StatefulWidget {
  const GeniusGamePage({super.key});

  @override
  State<GeniusGamePage> createState() => _GeniusGamePageState();
}

class _GeniusGamePageState extends State<GeniusGamePage> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late Listenable _repaintNotifier;
  bool _isSequencePlaying = false; // Controle para evitar chamadas duplicadas da animação

  final List<Color> _baseColors = const [
    Colors.green, Colors.red, Colors.yellow, Colors.blue,
    Colors.purple, Colors.orange, Colors.cyan, Colors.pink
  ];

  @override
  void initState() {
    super.initState();
    final provider = context.read<GeniusProvider>();
    
    _controllers = List.generate(provider.numberOfButtons, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      );
    });

    _animations = _controllers.map((c) => CurvedAnimation(parent: c, curve: Curves.easeInOut)).toList();
    _repaintNotifier = Listenable.merge(_controllers);
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _playSequence(List<int> sequence) async {
    if (_isSequencePlaying) return;
    _isSequencePlaying = true;

    await Future.delayed(const Duration(milliseconds: 500));

    for (int index in sequence) {
      if (!mounted) return;
      
      await _controllers[index].forward();
      await _controllers[index].reverse();
      
      await Future.delayed(const Duration(milliseconds: 150));
    }

    if (mounted) {
      _isSequencePlaying = false;
      context.read<GeniusProvider>().finishSequenceDisplay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GeniusProvider>(
      builder: (context, genius, child) {
        
        if (genius.state == GameState.showingSequence && !_isSequencePlaying) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _playSequence(genius.sequence);
          });
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Pontos: ${genius.score} | Recorde: ${genius.highScore}'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (genius.state == GameState.gameOver)
                const Text('GAME OVER!', style: TextStyle(fontSize: 28, color: Colors.red, fontWeight: FontWeight.bold))
              else if (genius.isPlayingSequence)
                const Text('Preste atenção!', style: TextStyle(fontSize: 22))
              else if (genius.state == GameState.playerTurn)
                const Text('Sua vez!', style: TextStyle(fontSize: 22, color: Colors.green)),

              const SizedBox(height: 20),

             
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GeniusWheelWidget(
  colors: genius.colors, // Usa as cores que estão no Provider!
  animations: _animations,
  repaint: _repaintNotifier,
  onButtonTap: (index) {
    genius.handlePlayerInput(index, () {
      _controllers[index].forward().then((_) => _controllers[index].reverse());
    });
  },
)
                ),
              ),

              if (genius.state == GameState.idle || genius.state == GameState.gameOver)
                ElevatedButton(
                  onPressed: () => genius.startGame(),
                  child: Text(genius.state == GameState.gameOver ? 'Tentar Novamente' : 'Iniciar Jogo'),
                ),
            ],
          ),
        );
      },
    );
  }
}