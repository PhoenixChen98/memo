//
//  AppDelegate.m
//  备忘录
//
//  Created by Phoenix on 2017/3/28.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    PhoTavCtrl *tavctrl=[[PhoTavCtrl alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *navctrl=[[UINavigationController alloc]initWithRootViewController:tavctrl];
    self.window.rootViewController=navctrl;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application{
    [[ItemStore sharedStore]saveChanges];
}

@end
