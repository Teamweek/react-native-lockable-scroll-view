//
//  TWLockableScrollView.h
//
//  Created by Michal Miškerník on 20/07/2016.
//  Copyright © 2016 Teamweek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTScrollView.h"

@interface TWLockableScrollView : RCTScrollView

- (void)lockBottomScrollOffset;

@end
