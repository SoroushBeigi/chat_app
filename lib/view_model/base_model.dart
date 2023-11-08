import 'package:flutter/foundation.dart';

class BaseModel extends ChangeNotifier{
  bool _busy = false;
  bool get getBusy => _busy;

  void setBusy(bool value){
    _busy = value;
    notifyListeners();
  }
}