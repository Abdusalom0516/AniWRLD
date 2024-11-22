import 'package:logger/logger.dart';

class LogService {
  final _logger = Logger();

  void d(String message) {
    _logger.d(message);
  }

  void e(String message) {
    _logger.e(message);
  }
}
