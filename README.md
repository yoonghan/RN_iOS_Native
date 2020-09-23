# Plain code for React Native UI
This project is to show the integration between React Native with a custom native IOS component.
[Reference](https://facebook.github.io/react-native/docs/native-components-ios.html)

## Base installation
1. Install node js of version 12.10.0. [Reference](https://nodejs.org/en/download/releases/)
2. Compared against Android, the iOS code is much more stable with every release of React Native. Just get the latest react-native

## Installation
1. Clone the project.
2. Cd to the folder and run the command

```
npm install
```
3. Install xCode, homebrew, watchman etc and follow all the steps in facebook document. Make sure you can at least startup React-Native iOS of the tutorial.
4. Open XCode and open "/ios/RNiOSIntegration.xcworkspace". (Make sure it's not *xcodeproj*)

## Goals
1. Create a layout in pure iOS. This is the walkthrough to get the module working in React Native project.
2. This project assumes that the React Native project is already created. If not do:
```
npx react-native init RNiOSIntegration
```

*NOTE*: For RN in iOS objective-C is the goal. Not sure on the latest news, but the base codes are still in Objective-C, hence there is a need to use Swift coding, it is required to create a *Bridge* between Objective-C and Swift.

![alt text](gitimg/sample.png?raw=true)


## Learn
These is how the bridge for the button is created.
1. Start XCode and open ${PROJECT_NAME}/ios/RNiOSIntegration.xcworkspace file. Create a simulator or attach a device and press Play.
2. Optional: Create a group named "Custom" .
3. Create a new *Swift* file named "CustomView". Upon creation, it will ask if Bridging is needed. Select yes.
4. Code within this swift file the iOS layout. Expose method with *objc* call.
5. On the bridging file (*-Bridging-Header.h), import "#import <React/RCTViewManager.h>". What this file does is that is exposes Objective library to swift. If any of your swift file complains library not found, it means the library is not imported here.
6. Create an "Objective-C file", these are to declare the methods/property to link to RCTViewManager. RCTViewManager is an ReactNative library to manage UIView.
```
#import <React/RCTViewManager.h>

//RCTCustomView is Swift bridged as objective-C
//Methods / property can only be exposed if it's prefixed with @objc
@interface RCT_EXTERN_MODULE(RCTCustomViewManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(status, BOOL)
@end
```
6. As android, we need to create a manager to link React Native and iOS native code.
```
@objc (RCTCustomViewManager)
class CustomViewManager: RCTViewManager {

override static func requiresMainQueueSetup() -> Bool {
  return true
}

override func view() -> UIView! {
  return CustomView()
}

}
```
7. Define in Javascript, a custom JS view. Sample JS created is CustomView.js
```javascript
  //File created is named CustomView.js
  import {requireNativeComponent, ViewPropTypes} from 'react-native';
  import PropTypes from 'prop-types';

  module.exports = requireNativeComponent('RCTCustomView', null);
```
8. Use it in the main Javascript code and remember to set the height/width.
```javascript
  import CustomView from './CustomView.js';
  ...
    render() {
     return
      ...
      <CustomView style={{height:200, width:200}}/>
      //It can be pointed in issue list (thanks) using flex will make it full screen. Else use height:null
      //BONUS: Updated to create <CustomView style={{height:200, width:200}} message={"Hi there"}/>
      ...;
    }
```
9. Added an event that receive onClick message, from native code. I.e. from Native code to React Native.
```
@interface RCT_EXTERN_MODULE(RCTCustomViewManager, RCTViewManager)
...
RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)
...
@end
```
```javascript
  <CustomView
    ...
    onClick={this._clickEvent}
    />
```

## Run it.
1. Open xcode and start a device emulator.
2. Once done, do the command.

```
npx react-native run-ios
```

3. Click the button and see the toast box appearing.
4. I am bad at iOS codes, so the logs generally to me are difficult to read.


## Issues

1. If code running complains simulator not found, run with your defined simulator
```
react-native run-ios --simulator="iPhone SE"
```
2. iOS codes are much stable, however i am not an expert on objective-C or swift and posed to be a bit problematic for me to explain. Hope this helps and if in future there a better person taking over, it'll be great!
