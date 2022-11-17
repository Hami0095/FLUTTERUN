import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Settings extends ChangeNotifier with HiveObjectMixin {
  @HiveField(0)
  bool _sfx = false;
  bool get soundeffect => _sfx;
  set soundEffects(bool value) {
    _sfx = value;
    notifyListeners();
    save();
  }

  @HiveField(1)
  bool _bgm = false;
  bool get backgroundMusic => _bgm;
  set backgroundMusic(bool value) {
    _bgm = value;
    notifyListeners();
    save();
  }

  Settings({bool soundEffects = false, bool backgroundMusic = false});
}
