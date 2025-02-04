import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_tindercard_plus_method_channel.dart';

abstract class FlutterTindercardPlusPlatform extends PlatformInterface {
  /// Constructs a FlutterTindercardPlusPlatform.
  FlutterTindercardPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTindercardPlusPlatform _instance = MethodChannelFlutterTindercardPlus();

  /// The default instance of [FlutterTindercardPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTindercardPlus].
  static FlutterTindercardPlusPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterTindercardPlusPlatform] when
  /// they register themselves.
  static set instance(FlutterTindercardPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
