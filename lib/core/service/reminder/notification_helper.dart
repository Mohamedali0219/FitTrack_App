import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeNotification() async {
    tz.initializeTimeZones();
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializeSettings = InitializationSettings(android: androidSettings);

    await _notificationsPlugin.initialize(initializeSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'reminder_channel',
      'Reminders',
      description:
          'channel for listening if you have a new reminder notification',
      importance: Importance.high,
      playSound: true,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> scheduleNotification(
      int id, String title, String category, DateTime scheduleTime) async {
    const androidDetails = AndroidNotificationDetails(
      'reminder_channel',
      'Reminders',
      importance: Importance.high,
      playSound: true,
      priority: Priority.high,
    );
    final notificationDetails = NotificationDetails(android: androidDetails);

    if (scheduleTime.isBefore(DateTime.now())) {
    } else {
      await _notificationsPlugin.zonedSchedule(
        id,
        title,
        category,
        tz.TZDateTime.from(scheduleTime, tz.local),
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }
  }

  static Future<void> cancelNotification(int id) async{
    await _notificationsPlugin.cancel(id);
  }
}
