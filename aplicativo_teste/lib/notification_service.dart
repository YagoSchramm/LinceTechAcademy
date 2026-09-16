import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static const int _testNotificationId = 1;
  static const int _stockNotificationId = 2;

  static const String _channelId = 'stock_alerts';
  static const String _channelName = 'Alertas de estoque';
  static const String _channelDescription =
      'Notificações relacionadas ao estoque dos produtos';

 Future<void> initialize() async {
  tz.initializeTimeZones();

  final timezone = await FlutterTimezone.getLocalTimezone();

  try {
    tz.setLocalLocation(
      tz.getLocation(timezone.identifier),
    );
  } on tz.LocationNotFoundException {
    tz.setLocalLocation(tz.UTC);
  }

  const androidSettings = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  const iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const settings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await _notifications.initialize(
    settings: settings,
  );

  await _requestPermissions();
}
  Future<void> _requestPermissions() async {
    final android = _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await android?.requestNotificationsPermission();

    final ios = _notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();

    await ios?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> showTestNotification() async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await _notifications.show(
      id: _testNotificationId,
      title: 'Notificação de teste',
      body: 'A notificação local está funcionando!',
      notificationDetails: notificationDetails,
    );
  }

  Future<void> scheduleStockNotification({
    required TimeOfDay time,
    required List<String> productNames,
  }) async {
    await _notifications.cancel(
      id: _stockNotificationId,
    );

    final now = tz.TZDateTime.now(tz.local);

    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(
        const Duration(days: 1),
      );
    }

    final body = productNames.isEmpty
        ? 'Nenhum produto está com estoque baixo.'
        : 'Estoque baixo: ${productNames.join(', ')}';

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await _notifications.zonedSchedule(
      id: _stockNotificationId,
      title: 'Alerta de estoque',
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: notificationDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelStockNotification() async {
    await _notifications.cancel(
      id: _stockNotificationId,
    );
  }
}