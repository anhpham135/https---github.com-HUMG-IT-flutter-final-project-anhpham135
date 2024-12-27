import 'package:final1/config/routes/routes.dart';
import 'package:final1/data/data.dart';
import 'package:final1/provider/provider.dart';
import 'package:final1/utils/utils.dart';
import 'package:final1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add New Task'),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonTextField(
              title: 'Task Title',
              hintText: 'Task Title',
              controller: _titleController,
            ),
            const Gap(16),
            const SelectCategory(),
            const Gap(16),
            const SelectDateTime(),
            const Gap(16),
            CommonTextField(
              //thêm ghi chú
              title: 'Note ?',
              hintText: 'Write Note',
              maxLines: 6,
              controller: _noteController,
            ),
            const Gap(60),
            ElevatedButton(
              // lưu
              onPressed: _createTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const DisplayWhiteText(text: 'Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Tasks(
        title: title,
        note: note,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        category: category,
        isCompleted: false,
      );
      // xư lý bất đồng bộ
      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        if (mounted) {
          AppAlerts.displaySnackBar(context, 'Task created successfully');
          Future.delayed(const Duration(microseconds: 700000), () {
            if (mounted) {
              context.go(RoutesLocation.home);
            }
          });
        }
      });
    } else {
      AppAlerts.displaySnackBar(context, 'Task title cannot be empty');
    }
  }
}

// sqllite doesnt sp bool, so work with nums 


// set up route 