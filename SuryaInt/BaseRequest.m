//
//  BaseRequest.m
//  SuryaS
//
//  Created by Somendra Singh on 13/07/15.
//  Copyright (c) 2015 somendra singh. All rights reserved.
//

#import "BaseRequest.h"
#import <AFNetworking.h>
@implementation BaseRequest
{
    
    NSDictionary *gotdata;
}


-( NSDictionary *) getJsonData:(NSString *)anynewparams actionmethod:(NSString *)action parameters:(NSDictionary *)params
                    onComplete:(void (^)(NSDictionary *json))successBlock
                       onError:(void (^)(NSError *error))errorBlock{
    
    
    __block id json;
    
    NSString     *weburl = @"http://surya-interview.appspot.com/";
    weburl=[weburl stringByAppendingString:action];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    manager.requestSerializer = requestSerializer;
    
    [manager POST:weburl parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         successBlock(responseObject);
         
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    
    
    return json;
    
    
}




@end
