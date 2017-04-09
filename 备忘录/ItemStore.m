//
//  ItemStore.m
//  备忘录
//
//  Created by Phoenix on 2017/3/29.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#import "ItemStore.h"

@interface ItemStore()

@end
@implementation ItemStore
+(instancetype)sharedStore{
    static ItemStore *sharedStore=nil;
    //判断是否需要创建一个sharedStore对象
    if (!sharedStore)
    {
        sharedStore=[[self alloc]init];
    }
    return sharedStore;
}
-(instancetype)init{
    self=[super init];
    if(self)
    {
        NSString *path=[self itemArchivePath];
        _allItems=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
        //如果未保存过
        if (!_allItems) {
            _allItems=[[NSMutableArray alloc]init];
        }
    }
    return self;
}
-(void)createItem{
    Item *newItem=[[Item alloc]init];
    [_allItems insertObject:newItem atIndex:0];
}
-(void)removeItemAtIndex:(NSInteger)index{
    [self.allItems removeObjectAtIndex:index];
}
-(void)moveItemAtIndex:(NSUInteger)fromIndex
               toIndex:(NSUInteger)toIndex{
    if (fromIndex==toIndex) {
        return;
    }
    Item *item=self.allItems[fromIndex];
    [self.allItems removeObjectAtIndex:fromIndex];
    [self.allItems insertObject:item atIndex:toIndex];
}
-(void)saveChanges{
    NSString *path=[self itemArchivePath];
    [NSKeyedArchiver archiveRootObject:self.allItems toFile:path];
    
}
-(NSString *)itemArchivePath{
    NSArray *documentDirectories=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}
@end
