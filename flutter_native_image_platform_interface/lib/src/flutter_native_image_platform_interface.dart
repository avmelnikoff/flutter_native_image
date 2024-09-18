import 'dart:async';
import 'dart:io';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class FlutterNativeImagePlatformInterface extends PlatformInterface {
  /// Constructs a MpNfcPlatformInterface.
  FlutterNativeImagePlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static FlutterNativeImagePlatformInterface _instance = _FlutterNativeImageImplementation();

  /// The default instance of [MpLoggerPlatformInterface] to use.
  ///
  /// Defaults to [_FlutterNativeImageImplementation].
  static FlutterNativeImagePlatformInterface get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterNativeImagePlatformInterface] when they register themselves.
  // TODO(amirh): Extract common platform interface logic.
  // https://github.com/flutter/flutter/issues/43368
  static set instance(FlutterNativeImagePlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // ===========================================================================
  // FlutterNativeImagePlatformInterface
  // ===========================================================================

  /// Compress an image
  ///
  /// Compresses the given [fileName].
  /// [percentage] controls by how much the image should be resized. (0-100)
  /// [quality] controls how strong the compression should be. (0-100)
  /// Use [targetWidth] and [targetHeight] to resize the image for a specific
  /// target size.
  static Future<File> compressImage(
    String fileName, {
    int percentage = 70,
    int quality = 70,
    int targetWidth = 0,
    int targetHeight = 0,
  }) =>
      throw UnimplementedError('compressImage() has not been implemented.');

  /// Gets the properties of an image
  ///
  /// Gets the properties of an image given the [fileName].
  static Future<ImageProperties> getImageProperties(String fileName) =>
      throw UnimplementedError('getImageProperties() has not been implemented.');

  /// Crops an image
  ///
  /// Crops the given [fileName].
  /// [originX] and [originY] control from where the image should be cropped.
  /// [width] and [height] control how the image is being cropped.
  static Future<File> cropImage(String fileName, int originX, int originY, int width, int height) =>
      throw UnimplementedError('cropImage() has not been implemented.');
}

/// Imageorientation enum used for [getImageProperties].
enum ImageOrientation {
  normal,
  rotate90,
  rotate180,
  rotate270,
  flipHorizontal,
  flipVertical,
  transpose,
  transverse,
  undefined,
}

/// Return value of [getImageProperties].
class ImageProperties {
  int? width;
  int? height;
  ImageOrientation orientation;

  ImageProperties({
    this.width = 0,
    this.height = 0,
    this.orientation = ImageOrientation.undefined,
  });
}

class _FlutterNativeImageImplementation extends FlutterNativeImagePlatformInterface {}
