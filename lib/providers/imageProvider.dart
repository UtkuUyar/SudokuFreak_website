import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageCarrier with ChangeNotifier {
  late Uint8List _imageData;
  bool _imageDataInitialized = false;

  void loadImage(Uint8List newData) {
    _imageData = Uint8List.fromList([...newData]);
    _imageDataInitialized = true;
    notifyListeners();
  }

  Uint8List get imageData {
    return Uint8List.fromList([..._imageData]);
  }

  bool get imageDataInitialized {
    return this._imageDataInitialized;
  }
}
