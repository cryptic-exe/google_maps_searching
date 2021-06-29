import UIKit
import Flutter
#include "GeneratedPluginRegistrant.h"

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    [GMSServices provideAPIKey:@"AIzaSyBziqiCTMbP_WOPSRWci9R8TkVbzFW0iFU"];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
