import 'dart:math';
import 'package:flutter/material.dart';

enum GameState { idle, showingSequence, playerTurn, gameOver }

class GeniusProvider extends ChangeNotifier {
 final List<Color> colors; // 1. Recebe a lista de cores customizada

  List<int> _sequence = [];
  int _playerStep = 0;
  int _score = 0;
  int _highScore = 0;
  GameState _state = GameState.idle;

  GeniusProvider({
    // Define cores padrão caso nenhuma seja passada
    this.colors = const [
      Colors.green,
      Colors.red,
      Colors.yellow,
      Colors.blue,
    ],
  });

  // 2. O número de botões é gerado dinamicamente pela quantidade de cores!
  int get numberOfButtons => colors.length;

  List<int> get sequence => _sequence;
  int get score => _score;
  int get highScore => _highScore;
  GameState get state => _state;
  bool get isPlayingSequence => _state == GameState.showingSequence;

  void startGame() {
    _sequence = [];
    _score = 0;
    _state = GameState.showingSequence;
    _addRandomColor();
    notifyListeners();
  }

  void _addRandomColor() {
    final random = Random();
    // Usa o numberOfButtons dinâmico
    _sequence.add(random.nextInt(numberOfButtons));
  }

  // Chamado quando o jogador clica em um botão
  void handlePlayerInput(int buttonIndex, VoidCallback onCorrectStep) {
    if (_state != GameState.playerTurn) return;

    if (buttonIndex == _sequence[_playerStep]) {
      // Jogada correta!
      _playerStep++;
      onCorrectStep(); // Executa callback (ex: tocar som ou animação do clique)

      // Se o jogador completou toda a sequência da rodada atual
      if (_playerStep >= _sequence.length) {
        _score++;
        if (_score > _highScore) _highScore = _score;
        
        _playerStep = 0;
        _state = GameState.showingSequence;
        _addRandomColor();
        notifyListeners(); // Notifica a UI para reproduzir a nova sequência
      }
    } else {
      // Jogada errada: Game Over!
      _state = GameState.gameOver;
      notifyListeners();
    }
  }

  // Chamado pela UI quando terminar de animar toda a sequência
  void finishSequenceDisplay() {
    _state = GameState.playerTurn;
    _playerStep = 0;
    notifyListeners();
  }
}