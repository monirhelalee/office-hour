import 'dart:io';

class Env {
  Env() {
    value = this;
  }

  static late Env value;
  late String pocketBaseURL;
}

class StgEnv extends Env {
  StgEnv() {
    pocketBaseURL = Platform.isAndroid
        ? 'http://10.0.2.2:8090'
        : 'http://127.0.0.1:8090';
  }
}

class ProductionEnv extends Env {
  ProductionEnv() {
    pocketBaseURL = '';
  }
}
