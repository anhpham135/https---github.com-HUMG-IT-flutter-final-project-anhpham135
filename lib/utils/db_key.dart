import 'package:final1/utils/utils.dart';
import 'package:flutter/material.dart';

@immutable
class DBKeys {
  const DBKeys._();
  static const String dbName = 'tasks.db';
  static const String dbTable = 'tasks';
  static const String idColumn = TaskKey.id;
  static const String titleColumn = TaskKey.title;
  static const String noteColumn = TaskKey.note;
  static const String timeColumn = TaskKey.time;
  static const String dateColumn = TaskKey.date;
  static const String categoryColumn = TaskKey.category;
  static const String isCompletedColumn = TaskKey.isCompleted;
}
