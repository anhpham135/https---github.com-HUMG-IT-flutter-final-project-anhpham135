import 'package:final1/data/data.dart';
import 'package:final1/provider/provider.dart';
import 'package:final1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
          style: context.textTheme.bodyLarge
              ?.copyWith(color: context.colorScheme.surface)),
      backgroundColor: context.colorScheme.primary,
    ));
  }

  static Future<void> showDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Tasks task,
  ) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(), // đóng hộp thoại
      child: const Text('NO'),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        AppAlerts.displaySnackBar(context, 'Task deleted !!!');
        // xóa task
        await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
          if (context.mounted) {
            context.pop();
          }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        });
        // thực hiện logic xóa task
      },
      child: const Text('YES'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this task ?'),
      actions: [deleteButton, cancelButton],
    );

    await showDialog(
        context: context,
        builder: (ctx) {
          return alert;
        });
  }
}
