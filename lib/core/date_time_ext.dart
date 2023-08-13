import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get format {
    final now = DateTime.now();

    return switch (this) {
      (final DateTime _)
          when day == now.day && month == now.month && year == now.year =>
        'Today',
      _ => DateFormat('dd MMM yyyy').format(this),
    };
  }
}
