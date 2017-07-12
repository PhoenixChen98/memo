//
//  PhoTavCtrl.m
//  备忘录
//
//  Created by Phoenix on 2017/3/28.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#import "PhoTavCtrl.h"

@interface PhoTavCtrl ()

@end

@implementation PhoTavCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellReuseIdentifier:@"ItemCell"];
    self.navigationItem.title=@"备忘录";
    UIBarButtonItem *addBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                      target:self
                                                                      action:@selector(addItem:)];
    self.navigationItem.rightBarButtonItem=addBtn;
//    UIBarButtonItem *editBtn=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editItem:)];
    self.navigationItem.leftBarButtonItem=self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(IBAction)addItem:(id)sender{
    [[ItemStore sharedStore]createItem];
    [self.tableView reloadData];
    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
}
//-(IBAction)editItem:(UIBarButtonItem *)sender{
//    if ([sender.title isEqual:@"完成"]) {
//        sender.title=@"编辑";
//        [self setEditing:NO animated:YES];
//    } else {
//        sender.title=@"完成";
//        [self setEditing:YES animated:YES];
//    }
//}
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return @"删除";
//}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ItemStore sharedStore].allItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    NSArray *items=[[ItemStore sharedStore]allItems];
    Item *cellItem=items[indexPath.row];
    cell.title.text=cellItem.title;
    cell.content.text=cellItem.content;
    CGFloat width=cell.content.frame.size.width;
    [cell.content sizeToFit];
    CGRect rect=cell.content.frame;
    rect.size.width=width;
    [cell.content setFrame:rect];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailController *detailCtrl=[[DetailController alloc]init];
    
    detailCtrl.detailItem=[[ItemStore sharedStore].allItems objectAtIndex:indexPath.row];
    if (detailCtrl.detailItem.title==nil&&detailCtrl.detailItem.content==nil) {
        detailCtrl.navigationItem.title=@"新建条目";
    }else{
        detailCtrl.navigationItem.title=@"详细信息";
        detailCtrl.index=indexPath.row;
    }

    [self.navigationController pushViewController:detailCtrl animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[ItemStore sharedStore]removeItemAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[ItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}
@end
