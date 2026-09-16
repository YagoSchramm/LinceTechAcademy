import 'dart:async';
import 'dart:math';

import 'package:app_genius/infrastructure/genius_game.dart';
import 'package:flutter/material.dart';

class GeniusProvider extends ChangeNotifier {
  final List<GeniusColor> colors = GeniusColor.values;

  final List<GeniusColor> _sequence = [];

  int _playerStep = 0;
  int _score = 0;
  int _highScore = 0;

  GameState _state = GameState.idle;

  GameMode _mode;

  GameResult _result = GameResult.none;

  Timer? _timer;

  DateTime? _timerStartedAt;

  double _timeProgress = 1.0;

  GeniusProvider({
    GameMode mode = GameMode.easy,
  }) : _mode = mode;

  // --------------------------------------------------
  // GETTERS
  // --------------------------------------------------

  List<GeniusColor> get sequence =>
      List.unmodifiable(_sequence);

  int get score => _score;

  int get highScore => _highScore;

  GameState get state => _state;

  GameMode get mode => _mode;

  GameResult get result => _result;

  double get timeProgress => _timeProgress;

  bool get isPlayingSequence =>
      _state == GameState.showingSequence;

  bool get hasTimer =>
      _mode.hasTimer &&
      _state == GameState.playerTurn;

  // --------------------------------------------------
  // MODE
  // --------------------------------------------------

  void setMode(GameMode mode) {
    _cancelTimer();

    _mode = mode;

    _timeProgress = 1.0;

    notifyListeners();
  }

  // --------------------------------------------------
  // START GAME
  // --------------------------------------------------

  void startGame() {
    _cancelTimer();

    _sequence.clear();

    _score = 0;
    _playerStep = 0;

    _timeProgress = 1.0;

    _result = GameResult.none;

    _state = GameState.showingSequence;

    _addRandomColor();

    notifyListeners();
  }

  // --------------------------------------------------
  // RANDOM COLOR
  // --------------------------------------------------

  void _addRandomColor() {
    final random = Random();

    _sequence.add(
      colors[random.nextInt(colors.length)],
    );
  }

  // --------------------------------------------------
  // PLAYER INPUT
  // --------------------------------------------------

  void handlePlayerInput(
    GeniusColor color,
    VoidCallback onCorrectStep,
  ) {
    if (_state != GameState.playerTurn) {
      return;
    }

    final expectedColor = _sequence[_playerStep];

    // ------------------------------------------------
    // ERROU
    // ------------------------------------------------

    if (color != expectedColor) {
      _gameOver();
      return;
    }

    // ------------------------------------------------
    // ACERTOU
    // ------------------------------------------------

    _playerStep++;

    onCorrectStep();

    // ------------------------------------------------
    // COMPLETOU A SEQUÊNCIA
    // ------------------------------------------------

    if (_playerStep >= _sequence.length) {
      _score++;

      if (_score > _highScore) {
        _highScore = _score;
      }

      // ----------------------------------------------
      // GANHOU
      // ----------------------------------------------

      if (_score >= _mode.winningScore) {
        _winGame();
        return;
      }

      // ----------------------------------------------
      // PRÓXIMA RODADA
      // ----------------------------------------------

      _playerStep = 0;

      _cancelTimer();

      _state = GameState.showingSequence;

      _addRandomColor();

      notifyListeners();

      return;
    }

    // ------------------------------------------------
    // CONTINUA JOGANDO
    // ------------------------------------------------

    _restartPlayerTimer();

    notifyListeners();
  }

  // --------------------------------------------------
  // SEQUENCE FINISHED
  // --------------------------------------------------

  void finishSequenceDisplay() {
    _playerStep = 0;

    _state = GameState.playerTurn;

    _startPlayerTimer();

    notifyListeners();
  }

  // --------------------------------------------------
  // START TIMER
  // --------------------------------------------------

  void _startPlayerTimer() {
    _cancelTimer();

    if (!_mode.hasTimer) {
      _timeProgress = 1.0;
      return;
    }

    _timerStartedAt = DateTime.now();

    _timeProgress = 1.0;

    _timer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        if (_state != GameState.playerTurn) {
          timer.cancel();
          return;
        }

        final elapsed =
            DateTime.now().difference(_timerStartedAt!);

        final progress =
            1 -
            elapsed.inMilliseconds /
                _mode.duration.inMilliseconds;

        _timeProgress =
            progress.clamp(0.0, 1.0);

        // --------------------------------------------
        // TEMPO ACABOU
        // --------------------------------------------

        if (_timeProgress <= 0) {
          timer.cancel();

          _timer = null;

          _gameOver();

          return;
        }

        notifyListeners();
      },
    );
  }

  // --------------------------------------------------
  // RESTART TIMER
  // --------------------------------------------------

  void _restartPlayerTimer() {
    if (!_mode.hasTimer) {
      return;
    }

    _startPlayerTimer();
  }

  // --------------------------------------------------
  // CANCEL TIMER
  // --------------------------------------------------

  void _cancelTimer() {
    _timer?.cancel();

    _timer = null;

    _timerStartedAt = null;

    _timeProgress = 1.0;
  }

  // --------------------------------------------------
  // GAME OVER
  // --------------------------------------------------

  void _gameOver() {
    _cancelTimer();

    _result = GameResult.lost;

    _state = GameState.gameOver;

    notifyListeners();
  }

  // --------------------------------------------------
  // WIN GAME
  // --------------------------------------------------

  void _winGame() {
    _cancelTimer();

    _result = GameResult.won;

    _state = GameState.gameOver;

    notifyListeners();
  }

  @override
  void dispose() {
    _cancelTimer();

    super.dispose();
  }
}