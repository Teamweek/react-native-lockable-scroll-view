//
//  LockableScrollView.m
//
//  Created by Michal Miškerník on 20/07/2016.
//  Copyright © 2016 Teamweek. All rights reserved.
//

#import "RCTScrollView.h"
#import "TWLockableScrollView.h"

@interface RCTScrollView ()

- (CGPoint)calculateOffsetForContentSize:(CGSize)newContentSize;

@end

@implementation TWLockableScrollView {
    BOOL _isLocked;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher {
    _isLocked = NO;
    return [super initWithEventDispatcher:eventDispatcher];
}

- (void)lockBottomScrollOffset {
    _isLocked = YES;
}

- (CGPoint)calculateOffsetForContentSize:(CGSize)newContentSize {
    NSLog(@"size changed");
    if (!_isLocked) {
        return [super calculateOffsetForContentSize:newContentSize];
    } else {
        _isLocked = NO;
        
        CGPoint oldContentOffset = self.scrollView.contentOffset;
        CGSize oldContentSize = self.scrollView.contentSize;
        float heightDifference = newContentSize.height - oldContentSize.height;
        
        return CGPointMake(oldContentOffset.x, oldContentOffset.y + heightDifference);
    }
}

@end
