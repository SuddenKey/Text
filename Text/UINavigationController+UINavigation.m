//
//  UINavigationController+UINavigation.m
//  Text
//
//  Created by KuiYin on 16/7/13.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "UINavigationController+UINavigation.h"
#import <objc/runtime.h>
@implementation UINavigationController (UINavigation)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         Class class = [self class];
        
        SEL originalSelector = @selector(initWithRootViewController:);
        SEL swizzledSelector = @selector(YHBaseInit);
        
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL didAddMethod =
        class_addMethod(class,originalSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
 
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}

- (instancetype) YHBaseInit {
    id __self = [self YHBaseInit];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor redColor]};
    return __self;
}

@end
