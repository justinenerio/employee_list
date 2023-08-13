import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:employee_list/core/date_time_ext.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CalendarPickerWidget extends StatefulWidget {
  const CalendarPickerWidget({required this.isStart, super.key, this.initial});

  final DateTime? initial;
  final bool isStart;

  static Future<DateTime?> show(
    BuildContext context, {
    DateTime? initial,
    bool isStart = true,
  }) =>
      showDialog<DateTime>(
        context: context,
        builder: (context) => Dialog(
          child: CalendarPickerWidget(
            initial: initial,
            isStart: isStart,
          ),
        ),
      );

  @override
  State<CalendarPickerWidget> createState() => _CalendarPickerWidgetState();
}

class _CalendarPickerWidgetState extends State<CalendarPickerWidget> {
  final _controller = TextEditingController();

  List<DateTime?> _dates = [];

  void _onSubmit(DateTime dateTime) => Navigator.of(context).pop(dateTime);

  void _clearDate() {
    setState(() {
      _dates = [];
    });
  }

  void _updateDate(DateTime date) {
    setState(() {
      _dates = [date];
    });
  }

  void _updateToWeek(int weekday) {
    final now = DateTime.now();

    var daysUntilNextWeekday = weekday - now.weekday;
    if (daysUntilNextWeekday <= 0) {
      daysUntilNextWeekday += 7;
    }
    final date = now.add(Duration(days: daysUntilNextWeekday));

    _updateDate(date);
  }

  @override
  void initState() {
    super.initState();

    if (widget.initial != null) {
      _dates = [widget.initial];
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final headerActions = GridView.count(
      padding: const EdgeInsets.all(8),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      childAspectRatio: 3.5,
      shrinkWrap: true,
      children: widget.isStart
          ? [
              ElevatedButton(
                onPressed: () => _updateDate(DateTime.now()),
                child: const Text('Today'),
              ),
              ElevatedButton(
                onPressed: () => _updateToWeek(1),
                child: const Text('Next Monday'),
              ),
              ElevatedButton(
                onPressed: () => _updateToWeek(2),
                child: const Text('Next Tuesday'),
              ),
              ElevatedButton(
                onPressed: () =>
                    _updateDate(DateTime.now().add(const Duration(days: 7))),
                child: const Text('After 1 week'),
              )
            ]
          : [
              ElevatedButton(
                onPressed: _clearDate,
                child: const Text('No Date'),
              ),
              ElevatedButton(
                onPressed: () => _updateDate(DateTime.now()),
                child: const Text('Today'),
              )
            ],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        headerActions,
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            centerAlignModePicker: true,
          ),
          value: _dates,
          onValueChanged: (dates) {
            setState(() {
              _dates = dates;
            });
          },
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              _DateLabel(_dates.firstOrNull),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (_dates.isEmpty) return;

                  _onSubmit(_dates.first!);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _DateLabel extends StatelessWidget {
  const _DateLabel(this.date);

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final label = date == null ? 'No Date' : date!.format;

    return Row(
      children: [
        const Icon(
          LineIcons.calendar,
          color: Color(0xFF1DA1F2),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
