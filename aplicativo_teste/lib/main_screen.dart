import 'dart:math';

import 'package:flutter/material.dart';

import 'notification_service.dart';
import 'product.dart';

class MainScreen extends StatefulWidget {
  final NotificationService notificationService;

  const MainScreen({
    super.key,
    required this.notificationService,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Random _random = Random();

  List<Product> _products = [];

  int _stockLimit = 5;

  TimeOfDay _notificationTime = const TimeOfDay(
    hour: 9,
    minute: 0,
  );

  List<Product> get _lowStockProducts {
    return _products
        .where(
          (product) => product.stock <= _stockLimit,
        )
        .toList();
  }

  void _mockProducts() {
    const names = [
      'Notebook',
      'Mouse',
      'Teclado',
      'Monitor',
      'Headset',
      'Webcam',
      'Microfone',
      'Mousepad',
      'SSD',
      'HD Externo',
    ];

    final products = List.generate(
      names.length,
      (index) {
        return Product(
          id: index + 1,
          name: names[index],
          price: 49.90 + _random.nextInt(950),
          stock: _random.nextInt(16),
        );
      },
    );

    setState(() {
      _products = products;
    });
  }

  Future<void> _selectNotificationTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: _notificationTime,
    );

    if (selectedTime == null) {
      return;
    }

    setState(() {
      _notificationTime = selectedTime;
    });
  }

  Future<void> _testNotification() async {
    await widget.notificationService.showTestNotification();

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Notificação de teste enviada.',
        ),
      ),
    );
  }

  Future<void> _scheduleStockNotification() async {
    final lowStockProducts = _lowStockProducts;

    await widget.notificationService.scheduleStockNotification(
      time: _notificationTime,
      productNames: lowStockProducts
          .map((product) => product.name)
          .toList(),
    );

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Alerta agendado para ${_notificationTime.format(context)}.',
        ),
      ),
    );
  }

  Future<void> _cancelNotification() async {
    await widget.notificationService.cancelStockNotification();

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Alerta de estoque cancelado.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lowStockProducts = _lowStockProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Alert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Limite de estoque',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                      text: _stockLimit.toString(),
                    ),
                    onChanged: (value) {
                      final limit = int.tryParse(value);

                      if (limit == null || limit < 0) {
                        return;
                      }

                      setState(() {
                        _stockLimit = limit;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: _mockProducts,
                  child: const Text('Mockar produtos'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estoque baixo',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${lowStockProducts.length} produto(s) '
                      'com estoque ≤ $_stockLimit',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: _products.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum produto mockado.',
                      ),
                    )
                  : ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final product = _products[index];

                        final isLowStock =
                            product.stock <= _stockLimit;

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                product.id.toString(),
                              ),
                            ),
                            title: Text(product.name),
                            subtitle: Text(
                              'R\$ ${product.price.toStringAsFixed(2)}',
                            ),
                            trailing: Text(
                              'Estoque: ${product.stock}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isLowStock
                                    ? Colors.red
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: _selectNotificationTime,
              icon: const Icon(Icons.schedule),
              label: Text(
                'Horário: ${_notificationTime.format(context)}',
              ),
            ),

            const SizedBox(height: 8),

            FilledButton.icon(
              onPressed: _scheduleStockNotification,
              icon: const Icon(Icons.notifications_active),
              label: const Text(
                'Agendar alerta de estoque',
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _testNotification,
                    icon: const Icon(Icons.notifications),
                    label: const Text(
                      'Testar',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _cancelNotification,
                    icon: const Icon(Icons.notifications_off),
                    label: const Text(
                      'Cancelar',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}