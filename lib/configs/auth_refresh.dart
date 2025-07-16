import 'package:flutter/foundation.dart';

class AuthRefresh extends ChangeNotifier {
  AuthRefresh(Stream stream) {
    stream.listen((_) => notifyListeners());
  }
}
