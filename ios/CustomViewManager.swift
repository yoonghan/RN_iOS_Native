//
//  CustomViewManager.swift
//  RNiOSIntegration
//
//  Created by Han on 22/9/20.
//

//Name for objective-C, refer to m. Refer to https://reactnative.dev/docs/native-components-ios
@objc (RCTCustomViewManager) //This will be the name in modules file and react native
class CustomViewManager: RCTViewManager {

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }

  override func view() -> UIView! {
    return CustomView()
  }

}
