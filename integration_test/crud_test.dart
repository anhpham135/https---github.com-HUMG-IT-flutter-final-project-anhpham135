import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:final1/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CRUD Integration Test', () {
    testWidgets('Create, Read, Update, Delete tasks',
        (WidgetTester tester) async {
      // Khởi chạy ứng dụng
      app.main();
      await tester.pumpAndSettle();

      // CREATE
      final addTaskButton = find.byKey(Key('add_task_button'));
      final taskInputField = find.byType(TextField);
      final saveButton = find.byKey(Key('save_button'));

      // Tạo một task mới
      await tester.tap(addTaskButton);
      await tester.pumpAndSettle();
      await tester.enterText(taskInputField, 'New Task');
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      // Kiểm tra task đã được tạo
      expect(find.text('New Task'), findsOneWidget);

      // READ
      // Kiểm tra rằng task đã được hiển thị
      expect(find.text('New Task'), findsOneWidget);

      // UPDATE
      // Cập nhật task
      final taskToEdit = find.text('New Task');
      await tester.tap(taskToEdit);
      await tester.pumpAndSettle();
      await tester.enterText(taskInputField, 'Updated Task');
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      // Kiểm tra rằng task đã được cập nhật
      expect(find.text('Updated Task'), findsOneWidget);
      expect(find.text('New Task'), findsNothing);

      // DELETE
      // Xóa task
      final deleteButton = find.byIcon(Icons.delete).first;
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      // Kiểm tra task đã bị xóa
      expect(find.text('Updated Task'), findsNothing);
    });
  });
}
