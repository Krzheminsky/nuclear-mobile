import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong2/latlong.dart';

class GetTappedPoints with ChangeNotifier {
  LatLng _protName = LatLng(49.7, 31.7);
  LatLng get getTappedPoints => _protName;
  void changeTappedPoints(LatLng newName) {
    _protName = newName;
    notifyListeners();
  }
}

class GetWindDirection with ChangeNotifier {
  double _name = 0.0;
  double get getWindDirection => _name;
  void changeWindDirection(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetWindSpeed with ChangeNotifier {
  double _name = 1;
  double get getWindSpeed => _name;
  void changeWindSpeed(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetExplosionPower with ChangeNotifier {
  double _name = 20;
  double get getExplosionPower => _name;
  void changeExplosionPower(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetTypeOfExplosion with ChangeNotifier {
  String _name = 'Наземний';
  String get getTypeOfExplosion => _name;
  void changeTypeOfExplosion(String newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetFireBall with ChangeNotifier {
  double _name = 0;
  double get getFireBall => _name;
  void changeFireBall(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetOverpressure20 with ChangeNotifier {
  double _name = 0;
  double get getOverpressure20 => _name;
  void changeOverpressure20(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetOverpressure10 with ChangeNotifier {
  double _name = 0;
  double get getOverpressure10 => _name;
  void changeOverpressure10(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetOverpressure5 with ChangeNotifier {
  double _name = 0;
  double get getOverpressure5 => _name;
  void changeOverpressure5(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetOverpressure1 with ChangeNotifier {
  double _name = 0;
  double get getOverpressure1 => _name;
  void changeOverpressure1(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetThermalRadiation1 with ChangeNotifier {
  double _name = 0;
  double get getThermalRadiation1 => _name;
  void changeThermalRadiation1(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetThermalRadiation2 with ChangeNotifier {
  double _name = 0;
  double get getThermalRadiation2 => _name;
  void changeThermalRadiation2(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetThermalRadiation3 with ChangeNotifier {
  double _name = 0;
  double get getThermalRadiation3 => _name;
  void changeThermalRadiation3(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetIonizingRadiation500 with ChangeNotifier {
  double _name = 0;
  double get getIonizingRadiation500 => _name;
  void changeIonizingRadiation500(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetIonizingRadiation100 with ChangeNotifier {
  double _name = 0;
  double get getIonizingRadiation100 => _name;
  void changeIonizingRadiation100(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetDepthA with ChangeNotifier {
  double _name = 0;
  double get getDepthA => _name;
  void changeDepthA(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetWidthA with ChangeNotifier {
  double _name = 0;
  double get getWidthA => _name;
  void changeWidthA(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetDepthB with ChangeNotifier {
  double _name = 0;
  double get getDepthB => _name;
  void changeDepthB(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetWidthB with ChangeNotifier {
  double _name = 0;
  double get getWidthB => _name;
  void changeWidthB(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetDepthV with ChangeNotifier {
  double _name = 0;
  double get getDepthV => _name;
  void changeDepthV(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetWidthV with ChangeNotifier {
  double _name = 0;
  double get getWidthV => _name;
  void changeWidthV(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetDepthG with ChangeNotifier {
  double _name = 0;
  double get getDepthG => _name;
  void changeDepthG(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetWidthG with ChangeNotifier {
  double _name = 0;
  double get getWidthG => _name;
  void changeWidthG(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetZoom with ChangeNotifier {
  double _name = 5.0;
  double get getZoom => _name;
  void changeZoom(double newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetFloatingButtonViev with ChangeNotifier {
  bool _name = false;
  bool get getFloatingButtonViev => _name;
  void changeFloatingButtonViev(bool newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetShockWave with ChangeNotifier {
  bool _name = true;
  bool get getShockWave => _name;
  void changeShockWave(bool newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetLightRad with ChangeNotifier {
  bool _name = true;
  bool get getLightRad => _name;
  void changeLightRad(bool newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetPenetRad with ChangeNotifier {
  bool _name = true;
  bool get getPenetRad => _name;
  void changePenetRad(bool newName) {
    _name = newName;
    notifyListeners();
  }
}

class GetRadContam with ChangeNotifier {
  bool _name = true;
  bool get getRadContam => _name;
  void changeRadContam(bool newName) {
    _name = newName;
    notifyListeners();
  }
}
