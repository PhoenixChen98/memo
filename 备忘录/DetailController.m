//
//  DetailController.m
//  备忘录
//
//  Created by Phoenix on 2017/3/28.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleField.text=self.detailItem.title;
    self.content.text=self.detailItem.content;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    if ([self.titleField.text isEqualToString:@""]&&[self.content.text isEqualToString:@""]) {
        [[ItemStore sharedStore] removeItemAtIndex:0];
    } else {
        self.detailItem.title=self.titleField.text;
        self.detailItem.content=self.content.text;
        [[ItemStore sharedStore]moveItemAtIndex:self.index toIndex:0];
    }
    
}


@end
