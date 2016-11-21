//
//  DevicePickerViewController.m
//  FtheLinePrintStar
//
//  Created by Phil Huffman on 2016-11-17.
//  Copyright © 2016 Star Micronics. All rights reserved.
//

#import "DevicePickerViewController.h"

@interface DevicePickerViewController ()

@end

@implementation DevicePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _pickerView = [UIPickerView new];
    _pickerView.delegate = self; // Also, can be done from IB, if you're using
    _pickerView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [ModelCapability modelIndexCount];
}
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {

    return [ModelCapability titleAtModelIndex:[ModelCapability modelIndexAtIndex:row]];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    _modelName = [ModelCapability titleAtModelIndex:[ModelCapability modelIndexAtIndex:row]];
    NSLog(@"%@", _modelName);
    
}

- (IBAction)cancelPressed:(UIButton *)sender {
    _modelName = @"";
    [self performSegueWithIdentifier:@"unwindSegueToDevicePicker" sender:self];
}

- (IBAction)donePressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"unwindSegueToDevicePicker" sender:self];
}

@end
