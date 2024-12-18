import 'package:final1/provider/provider.dart';
import 'package:final1/utils/utils.dart';
import 'package:final1/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            // chọn ngày
            title: 'Date',
            hintText: DateFormat.yMMMd().format(date),
            readOnly: true,
            suffixIcon: IconButton(
                onPressed: () => _selecDate(context, ref),
                icon: const FaIcon(FontAwesomeIcons.calendar)),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CommonTextField(
            // chọn giờ
            title: 'Time',
            hintText: Helpers.timeToString(time),
            readOnly: true,
            suffixIcon: IconButton(
                onPressed: () => _selecTime(context, ref),
                icon: const FaIcon(FontAwesomeIcons.clock)),
          ),
        ),
      ],
    );
  }
}

void _selecTime(BuildContext context, WidgetRef ref) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (pickedTime != null) {
    ref.read(timeProvider.notifier).state = pickedTime; // Cập nhật sate
  }
}

void _selecDate(BuildContext context, WidgetRef ref) async {
  final initialDate = ref.read(dateProvider);
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate, // lấy giá trị ban đầu từ Provider
    firstDate: DateTime(2023),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    ref.read(dateProvider.notifier).state = pickedDate; // Cập nhật sate
  }
}
