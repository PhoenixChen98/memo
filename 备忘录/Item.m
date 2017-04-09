
//
//  Item.m
//  备忘录
//
//  Created by Phoenix on 2017/3/29.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#import "Item.h"

@implementation Item
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"itemTitle"];
    [aCoder encodeObject:self.content forKey:@"itemContent"];

}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super init];
    if (self) {
        _title=[aDecoder decodeObjectForKey:@"itemTitle"];
        _content=[aDecoder decodeObjectForKey:@"itemContent"];
    }
    return self;
}
@end
