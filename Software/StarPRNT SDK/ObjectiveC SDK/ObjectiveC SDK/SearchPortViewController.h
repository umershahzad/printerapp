//
//  SearchPortViewController.h
//  ObjectiveC SDK
//
//  Created by Yuji on 2015/**/**.
//  Copyright (c) 2015年 Star Micronics. All rights reserved.
//

#import "CommonViewController.h"
#import "DevicePickerViewController.h"

@interface SearchPortViewController : CommonViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
