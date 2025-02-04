import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_tindercard_plus_platform_interface.dart';

/// An implementation of [FlutterTindercardPlusPlatform] that uses method channels.
class MethodChannelFlutterTindercardPlus extends FlutterTindercardPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_tindercard_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
