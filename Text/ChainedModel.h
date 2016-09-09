//
//  ChainedModel.h
//  Text
//
//  Created by HaoHao on 16/8/31.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChainedModel;

typedef ChainedModel *(^ChainedModelVoidBlock)();

typedef ChainedModel *(^ChainedModelStringBlock)(NSString *);

@interface ChainedModel : NSObject

- (ChainedModelVoidBlock)begin;

- (ChainedModelVoidBlock)end;

- (ChainedModelStringBlock)secondBlcok;

@end
