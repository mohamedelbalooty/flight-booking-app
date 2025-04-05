import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toDdMmYyyy() => _formatDateTime(this, DateFormat('dd/MM/yyyy'));

  String toDdMmYyyyWithDashes() =>
      _formatDateTime(this, DateFormat('dd-MM-yyyy'));

  String toYyyyMmDd() => _formatDateTime(this, DateFormat('yyyy/MM/dd'));

  String toYyyyMmDdWithDashes() =>
      _formatDateTime(this, DateFormat('yyyy-MM-dd'));

  String toDdMmmYyyy() => _formatDateTime(this, DateFormat('dd MMM, yyyy'));

  String toEeeDdMmmYyyy() =>
      _formatDateTime(this, DateFormat('EEE, dd MMM yyyy'));

  String toEeeeDdMmmmYyyy() =>
      _formatDateTime(this, DateFormat('EEEE, dd MMMM yyyy'));

  String toDdMmmYyyyWithDashes() =>
      _formatDateTime(this, DateFormat('dd-MMM-yyyy'));

  String toDdMmmmYyyy() => _formatDateTime(this, DateFormat('dd MMMM, yyyy'));

  String toMmDdYyyy() => _formatDateTime(this, DateFormat('MM/dd/yyyy'));

  String toMmDdYyyyWithDashes() =>
      _formatDateTime(this, DateFormat('MM-dd-yyyy'));

  String toDd() => _formatDateTime(this, DateFormat('dd'));

  String toMmm() => _formatDateTime(this, DateFormat('MMM'));

  String toMmmm() => _formatDateTime(this, DateFormat('MMMM'));

  String toYyyy() => _formatDateTime(this, DateFormat('yyyy'));

  String toDdMmmYyyyHhMmAmPm() =>
      _formatDateTime(this, DateFormat('dd MMM yyyy hh:mm a'));

  String toDdMmYyyyHhMm() =>
      _formatDateTime(this, DateFormat('dd/MM/yyyy HH:mm'));

  String toHhMmAmPm() => _formatDateTime(this, DateFormat('hh:mm a'));

  String toHhMmSs() => _formatDateTime(this, DateFormat('HH:mm:ss'));
}

extension NullableDateTimeExtensions on DateTime? {
  String toDdMmYyyy() => _formatDateTime(this, DateFormat('dd/MM/yyyy'));

  String toDdMmYyyyWithDashes() =>
      _formatDateTime(this, DateFormat('dd-MM-yyyy'));

  String toYyyyMmDd() => _formatDateTime(this, DateFormat('yyyy/MM/dd'));

  String toYyyyMmDdWithDashes() =>
      _formatDateTime(this, DateFormat('yyyy-MM-dd'));

  String toDdMmmYyyy() => _formatDateTime(this, DateFormat('dd MMM, yyyy'));

  String toEeeDdMmmYyyy() =>
      _formatDateTime(this, DateFormat('EEE, dd MMM yyyy'));

  String toEeeeDdMmmmYyyy() =>
      _formatDateTime(this, DateFormat('EEEE, dd MMMM yyyy'));

  String toDdMmmYyyyWithDashes() =>
      _formatDateTime(this, DateFormat('dd-MMM-yyyy'));

  String toDdMmmmYyyy() => _formatDateTime(this, DateFormat('dd MMMM, yyyy'));

  String toMmDdYyyy() => _formatDateTime(this, DateFormat('MM/dd/yyyy'));

  String toMmDdYyyyWithDashes() =>
      _formatDateTime(this, DateFormat('MM-dd-yyyy'));

  String toDd() => _formatDateTime(this, DateFormat('dd'));

  String toMmm() => _formatDateTime(this, DateFormat('MMM'));

  String toMmmm() => _formatDateTime(this, DateFormat('MMMM'));

  String toYyyy() => _formatDateTime(this, DateFormat('yyyy'));

  String toDdMmmYyyyHhMmAmPm() =>
      _formatDateTime(this, DateFormat('dd MMM yyyy hh:mm a'));

  String toDdMmYyyyHhMm() =>
      _formatDateTime(this, DateFormat('dd/MM/yyyy HH:mm'));

  String toHhMmAmPm() => _formatDateTime(this, DateFormat('hh:mm a'));

  String toHhMmSs() => _formatDateTime(this, DateFormat('HH:mm:ss'));

  String toEeeeDdMmmmYyyyHhMmAmPm() =>
      _formatDateTime(this, DateFormat('dd MMMM yy hh:mm a'));
}

String _formatDateTime(DateTime? dateTime, DateFormat format) {
  return dateTime != null ? format.format(dateTime) : '';
}
