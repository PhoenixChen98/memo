//
//  ItemStore.h
//  备忘录
//
//  Created by Phoenix on 2017/3/29.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
@interface ItemStore : NSObject
@property(nonatomic)NSMutableArray *allItems;

+(instancetype)sharedStore;
-(void)createItem;
-(void)removeItemAtIndex:(NSInteger)index;
-(void)moveItemAtIndex:(NSUInteger)fromIndex
               toIndex:(NSUInteger)toIndex;
-(void)saveChanges;
@end
