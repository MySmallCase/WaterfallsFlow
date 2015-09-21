//
//  NewedorsementModel.h
//  DYStore
//
//  Created by MyMac on 15/8/12.
//  Copyright (c) 2015年 daiyanwang. All rights reserved.
//

#import <Foundation/Foundation.h>


//"id": "4",
//"img": "http://img0.imgtn.bdimg.com/it/u=1895434866,3601111984&fm=21&gp=0.jpg",
//"name": "刘亦菲",
//"votes": "198",

@interface NewedorsementModel : NSObject

@property (nonatomic,copy) NSString *code;

@property (nonatomic,copy) NSString *msg;

@property (nonatomic,copy) NSArray *data;


@end
