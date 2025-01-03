import 'package:final1/screen/create_task_screen.dart'; // Đường dẫn tới file CreateTaskScreen
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:final1/widgets/widgets.dart';
import 'package:final1/screen/screen.dart';
import 'package:final1/provider/provider.dart';

void main() {
  group('CreateTaskScreen', () {
    testWidgets('Hiển thị đúng các thành phần giao diện',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: CreateTaskScreen(),
          ),
        ),
      );

      // Kiểm tra tiêu đề AppBar
      expect(find.text('Add New Task'), findsOneWidget);

      // Kiểm tra các trường nhập liệu
      expect(find.byType(CommonTextField), findsNWidgets(4)); // Title + Note

      // Kiểm tra các widget con
      expect(find.byType(SelectCategory), findsOneWidget);
      expect(find.byType(SelectDateTime), findsOneWidget);

      // Kiểm tra nút Save
      expect(find.text('Save'), findsOneWidget);
    });

    testWidgets('Hiển thị thông báo khi Task Title bị bỏ trống',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: CreateTaskScreen(),
          ),
        ),
      );

      // Nhấn nút Save mà không nhập Task Title
      await tester.tap(find.text('Save'));
      await tester.pump();

      // Kiểm tra thông báo lỗi
      expect(find.text('Task title cannot be empty'), findsOneWidget);
    });

    testWidgets('Tạo task thành công và điều hướng về màn hình chính',
        (WidgetTester tester) async {
      // Mock các provider
      final mockTaskProvider = MockTaskProvider();
      when(() => mockTaskProvider.createTask(any()))
          .thenAnswer((_) async => true);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            taskProvider.overrideWith((ref) => mockTaskProvider),
          ],
          child: MaterialApp(
            home: CreateTaskScreen(),
          ),
        ),
      );

      // Nhập Task Title
      await tester.enterText(find.byType(CommonTextField).first, 'Test Task');

      // Nhấn nút Save
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo thành công
      expect(find.text('Task created successfully'), findsOneWidget);

      // Kiểm tra điều hướng về màn hình chính (giả sử có RoutesLocation.home)
      expect(find.text('Home'), findsOneWidget);
    });
  });
}

class MockTaskProvider extends Mock implements TaskNotifier {}
