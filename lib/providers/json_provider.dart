import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonProvider {
  static const _BASE_PATH = 'assets/json/';
  
  static const USER = '${_BASE_PATH}user.json';
  static const CONSUMER = '${_BASE_PATH}consumer.json';
  static const PROVIDER = '${_BASE_PATH}provider.json';
  static const EVENT = '${_BASE_PATH}event.json';
  static const PAYMENT_METHOD = '${_BASE_PATH}paymentMethod.json';
  static const PLANBOOK = '${_BASE_PATH}planbook.json';

  static void loadData(String path, Function callback) {
    rootBundle.loadString(path).then((value) => json.decode(value)).then((data) => callback(data));
  }

}
