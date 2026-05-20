import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  bool _isInativo = false;

  String? _nomeSalvo;
  int? _idadeSalva;
  bool? _inativoSalvo;

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _nomeSalvo = _nomeController.text;
        _idadeSalva = int.parse(_idadeController.text);
        _inativoSalvo = _isInativo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulário Flutter',
      home: Scaffold(
        appBar: AppBar(title: Text('Formulário Flutter')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'O nome não pode ser vazio.';
                        }
                        if (value.trim().length < 3) {
                          return 'O nome deve ter pelo menos 3 letras.';
                        }
                        if (value.trim()[0] != value.trim()[0].toUpperCase() ||
                            !RegExp(r'^[A-ZÀ-Ú]').hasMatch(value.trim()[0])) {
                          return 'O nome deve começar com uma letra maiúscula.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 18),
                    TextFormField(
                      controller: _idadeController,
                      decoration: InputDecoration(
                        labelText: "Idade",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Indicador de Inativo (Switch)
                    SwitchListTile(
                      title: const Text('Inativo'),
                      value: _isInativo,
                      onChanged: (bool value) {
                        setState(() {
                          _isInativo = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _salvarFormulario,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Salvar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              if (_nomeSalvo != null) ...[
                const Text(
                  'Dados Salvos:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    // Define a cor de fundo com base no indicador "Inativo" salvo
                    color: _inativoSalvo!
                        ? Colors.grey[300]
                        : Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _inativoSalvo! ? Colors.grey : Colors.green,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome: $_nomeSalvo',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Idade: $_idadeSalva',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Status: ${_inativoSalvo! ? "Inativo" : "Ativo"}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _inativoSalvo!
                              ? Colors.grey[800]
                              : Colors.green[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
