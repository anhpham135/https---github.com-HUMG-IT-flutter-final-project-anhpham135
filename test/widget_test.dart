import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:final1/screen/create_task_screen.dart';

void main() {
  testWidgets('Should display success SnackBar when task is created',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreateTaskScreen()));

    // Nhập thông tin
    await tester.enterText(find.byKey(const Key('titleField')), 'New Task');
    await tester.tap(find.byType(ElevatedButton)); // Nhấn nút tạo task

    // Chờ SnackBar hiển thị
    await tester.pump();

    expect(find.text('Task created successfully'),
        findsOneWidget); // Kiểm tra SnackBar
  });
}
