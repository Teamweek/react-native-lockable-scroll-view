//
//  TWLockableScrollViewManager.m
//  InfiniteScroll
//
//  Created by Michal Miškerník on 20/07/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//


#import "RCTBridge.h"
#import "RCTUIManager.h"

#import "TWLockableScrollViewManager.h"
#import "TWLockableScrollView.h"

@implementation TWLockableScrollViewManager

RCT_EXPORT_MODULE();

- (UIView *)view {
  return [[TWLockableScrollView alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

RCT_EXPORT_METHOD(lockBottomScrollOffset:(nonnull NSNumber *)reactTag) {
  [self.bridge.uiManager addUIBlock:
   ^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, TWLockableScrollView *> *viewRegistry) {
     
     TWLockableScrollView *view = viewRegistry[reactTag];
     if (!view || ![view isKindOfClass:[TWLockableScrollView class]]) {
       RCTLogError(@"Cannot find TWLockableScrollView with tag #%@", reactTag);
       return;
     }
     
     [view lockBottomScrollOffset];
   }];
}

@end
