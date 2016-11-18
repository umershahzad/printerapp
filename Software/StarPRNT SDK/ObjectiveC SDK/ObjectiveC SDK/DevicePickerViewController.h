//
//  DevicePickerViewController.h
//  FtheLinePrintStar
//
//  Created by Phil Huffman on 2016-11-17.
//  Copyright © 2016 Star Micronics. All rights reserved.
//

#import "CommonViewController.h"
#import "ModelCapability.h"

@interface DevicePickerViewController : CommonViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSString *modelName;
@property (nonatomic, strong) UIPickerView *pickerView;
@end
