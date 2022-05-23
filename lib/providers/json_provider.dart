import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void loadData(String path, Function callback) {
  rootBundle.loadString(path).then((value) => json.decode(value)).then((data) => callback(data));
}
