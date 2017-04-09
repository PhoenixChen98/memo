//
//  DetailController.h
//  备忘录
//
//  Created by Phoenix on 2017/3/28.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ItemStore.h"
@interface DetailController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property(nonatomic)Item *detailItem;
@property(nonatomic)NSInteger index;
@end
