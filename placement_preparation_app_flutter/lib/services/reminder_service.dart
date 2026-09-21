import 'package:shared_preferences/shared_preferences.dart';

class ReminderService {
  static const String _hourKey = 'reminder_hour';
  static const String _minuteKey = 'reminder_minute';
  static const String _enabledKey = 'reminder_enabled';

  static Future<void> saveReminder({
    required int hour,
    required int minute,
    required bool enabled,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_hourKey, hour);
    await prefs.setInt(_minuteKey, minute);
    await prefs.setBool(_enabledKey, enabled);
  }

  static Future<ReminderSettings> getReminder() async {
    final prefs = await SharedPreferences.getInstance();

    return ReminderSettings(
      hour: prefs.getInt(_hourKey) ?? 19,
      minute: prefs.getInt(_minuteKey) ?? 0,
      enabled: prefs.getBool(_enabledKey) ?? false,
    );
  }

  static Future<void> disableReminder() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      _enabledKey,
      false,
    );
  }
}

class ReminderSettings {
  final int hour;
  final int minute;
  final bool enabled;

  const ReminderSettings({
    required this.hour,
    required this.minute,
    required this.enabled,
  });

  String get formattedTime {
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);

    final minuteText = minute.toString().padLeft(2, '0');

    final period = hour >= 12 ? 'PM' : 'AM';

    return '$hour12:$minuteText $period';
  }
}
