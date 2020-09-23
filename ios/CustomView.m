//
//  CustomView.m
//  RNiOSIntegration
//
//  Created by Han on 22/9/20.
//

#import <React/RCTViewManager.h>

//RCTCustomView is Swift bridged as objective-C
//Methods / property can only be exposed if it's prefixed with @objc
@interface RCT_EXTERN_MODULE(RCTCustomViewManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(status, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)
@end

