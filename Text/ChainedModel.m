//
//  ChainedModel.m
//  Text
//
//  Created by HaoHao on 16/8/31.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "ChainedModel.h"

@implementation ChainedModel


- (ChainedModelVoidBlock)begin {
    return ^ChainedModel *(NSString *astring) {
        NSLog(@"astring = %@", astring);
        return self;
    };
}

- (ChainedModelVoidBlock)end {
    return ^ChainedModel *(NSString *astring) {
        NSLog(@"astring = %@", astring);
        return self;
    };
}

- (ChainedModelStringBlock)secondBlcok {
    return ^ChainedModel *(NSString *astring) {
        NSLog(@"astring = %@", astring);
        return self;
    };
}

@end
