import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/progress.dart';
import '../models/student.dart';

class StorageService {
  static const String _studentKey = 'student';
  static const String _progressKey = 'progress';

  Future<void> saveStudent(Student student) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _studentKey,
      jsonEncode(student.toMap()),
    );
  }

  Future<Student?> getStudent() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_studentKey);

    if (data == null) {
      return null;
    }

    return Student.fromMap(
      jsonDecode(data) as Map<String, dynamic>,
    );
  }

  Future<void> saveProgress(Progress progress) async {
    final prefs = await SharedPreferences.getInstance();

    final existing = await getProgress();

    final updated =
        existing.where((item) => item.moduleId != progress.moduleId).toList();

    updated.add(progress);

    await prefs.setString(
      _progressKey,
      jsonEncode(
        updated.map((item) => item.toMap()).toList(),
      ),
    );
  }

  Future<List<Progress>> getProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_progressKey);

    if (data == null) {
      return [];
    }

    final decoded = jsonDecode(data) as List;

    return decoded
        .map(
          (item) => Progress.fromMap(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_studentKey);
    await prefs.remove(_progressKey);
  }
}
