@JS('window')
library js_util;

import 'package:js/js.dart';

@JS()
external set updatePageIdentity(void Function(String title, String favicon) f);

@JS()
external dynamic get context;

@JS('eval')
external void eval(String code);

void initializeJS() {
  eval('''
    window.updatePageIdentity = function(title, favicon) {
      document.title = title;
      document.getElementById('favicon').href = favicon;
    }
  ''');
}
