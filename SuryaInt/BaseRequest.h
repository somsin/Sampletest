//
//  BaseRequest.h
//  SuryaS
//
//  Created by Somendra Singh on 13/07/15.
//  Copyright (c) 2015 somendra singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequest : NSObject
{
}

-(NSString *) getJsonData:(NSString *)anynewparams actionmethod:(NSString *)action parameters:(NSDictionary *)params onComplete:(void (^)(NSDictionary *json))successBlock
                  onError:(void (^)(NSError *error))errorBlock;

@end
