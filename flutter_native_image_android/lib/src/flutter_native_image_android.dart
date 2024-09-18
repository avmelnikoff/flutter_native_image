import 'package:flutter_native_image_platform_interface/flutter_native_image_platform_interface.dart';

class FlutterNativeImageIos extends FlutterNativeImageMethodChannel {
  /// Registers this class as the default instance of [MpLoggerPlatformInterface].
  static void registerWith() {
    FlutterNativeImagePlatformInterface.instance = FlutterNativeImageIos();
  }
}
