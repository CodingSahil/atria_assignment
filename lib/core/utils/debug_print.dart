import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

void debugLog(String message, {String name = "log => "}) {
  if (kDebugMode) {
    log(message, name: name);
  }
}

EdgeInsets defaultPaddingForListView() {
  return EdgeInsets.symmetric(vertical: 20, horizontal: 24);
}
