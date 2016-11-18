//
//  SearchPortViewController.m
//  ObjectiveC SDK
//
//  Created by Yuji on 2015/**/**.
//  Copyright (c) 2015年 Star Micronics. All rights reserved.
//

#import "SearchPortViewController.h"
#import "AppDelegate.h"
#import "ModelCapability.h"
#import "DevicePickerViewController.h"
#import <StarIO/SMPort.h>

typedef NS_ENUM(NSInteger, CellParamIndex) {
    CellParamIndexPortName = 0,
    CellParamIndexModelName,
    CellParamIndexMacAddress
};

typedef NS_ENUM(NSInteger, AlertViewIndex) {
    AlertViewIndexRefreshPort = 0,
    AlertViewIndexPortName,
    AlertViewIndexPortSettings,
    AlertViewIndexModelConfirm,
    AlertViewIndexModelSelect0,
    AlertViewIndexModelSelect1,
    AlertViewIndexCashDrawerOpenActive
};

@interface SearchPortViewController ()

@property (nonatomic) NSMutableArray *cellArray;
@property (nonatomic) NSIndexPath *selectedIndexPath;
@property (nonatomic) BOOL didAppear;
@property (nonatomic) NSString *portName;
@property (nonatomic) NSString *portSettings;
@property (nonatomic) NSString *modelName;
@property (nonatomic) NSString *macAddress;
@property (nonatomic) StarIoExtEmulation emulation;
@property (nonatomic) NSDictionary *interfaceMathods;

- (void)refreshPortInfo;
- (void)lanSelected;

@end

@implementation SearchPortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self appendRefreshButton:@selector(refreshPortInfo)];

    _cellArray = [[NSMutableArray alloc] init];
    _selectedIndexPath = nil;
    _didAppear = NO;

    _interfaceMathods = @{@"LAN":[NSValue valueWithPointer:@selector(lanSelected)],
                          @"Bluetooth":[NSValue valueWithPointer:@selector(bluetoothSelected)],
                          @"Bluetooth Low Energy":[NSValue valueWithPointer:@selector(bleSelected)],
                          @"All":[NSValue valueWithPointer:@selector(allSelected)],
                          @"Manual":[NSValue valueWithPointer:@selector(manualSelected)]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if (_didAppear == NO) {
        [self refreshPortInfo];
        _didAppear = YES;
    }
}

#pragma mark - Navigation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"UITableViewCellStyleSubtitle";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    } else {
        NSArray *cellParam = _cellArray[indexPath.row];
        cell.textLabel.text = cellParam[CellParamIndexModelName];
        if ([cellParam[CellParamIndexMacAddress] isEqualToString:@""]) {
            cell.detailTextLabel.text = cellParam[CellParamIndexPortName];
        } else {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%@)",
                                         cellParam[CellParamIndexPortName],
                                         cellParam[CellParamIndexMacAddress]];
        }

        cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
        cell.accessoryType = UITableViewCellAccessoryNone;

        if (_selectedIndexPath != nil) {
            if ([indexPath compare:_selectedIndexPath] == NSOrderedSame) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
        }
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"List";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //  [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UITableViewCell *cell;

    if (_selectedIndexPath != nil) {
        cell = [tableView cellForRowAtIndexPath:_selectedIndexPath];

        if (cell != nil) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }

    cell = [tableView cellForRowAtIndexPath:indexPath];

    cell.accessoryType = UITableViewCellAccessoryCheckmark;

    _selectedIndexPath = indexPath;

    NSArray *cellParam = _cellArray[_selectedIndexPath.row];
    NSString *modelName  = cellParam[CellParamIndexModelName];

    ModelIndex modelIndex = [ModelCapability modelIndexAtModelName:modelName];

    if (modelIndex == ModelIndexNone) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Confirm."
                                                                                 message:@"What is your printer?"
                                                                          preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              [self closeAlertview];
                                                          }
                                    ]
         ];

        dispatch_async(dispatch_get_main_queue(), ^ {
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        });
    }
}

- (void)refreshPortInfo {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Select Interface."
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    for (NSString *key in [_interfaceMathods allKeys]) {
        [alertController addAction:[UIAlertAction actionWithTitle:key
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              SEL handle = (SEL)[[_interfaceMathods objectForKey:key] pointerValue];
                                                              [self performSelector:handle];
                                                          }]];
    }

    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self closeAlertview];
                                                      }]];

    dispatch_async(dispatch_get_main_queue(), ^ {
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
    });
}

-(void)lanSelected {
    [self closeAlertview];
}

-(void)bluetoothSelected {
    [self closeAlertview];
}

-(void)bleSelected {
    [self closeAlertview];
}

-(void)allSelected {
    [self closeAlertview];
}

-(void)manualSelected {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Manual Configuration"
                                                                             message:@"Input port name & address"
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Port name";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Port Address";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];

    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          NSArray *textfields = alertController.textFields;
                                                          UITextField *nameField = textfields[0];
                                                          UITextField *settingsField = textfields[1];
                                                          _portName = nameField.text;
                                                          _portSettings = settingsField.text;
                                                          [self confirmDevice];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"CANCEL"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self closeAlertview];
                                                      }]];
    
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

-(void)confirmDevice {
    [self performSegueWithIdentifier:@"segueToDevicePicker" sender:self];
}

- (IBAction)unwindFromModalViewController:(UIStoryboardSegue *)segueToDevicePicker {
    if ([segueToDevicePicker.sourceViewController isKindOfClass:[DevicePickerViewController class]]) {
        DevicePickerViewController *devicePicker = segueToDevicePicker.sourceViewController;
        if (devicePicker.modelName) {
            _modelName = devicePicker.modelName;
        }
    }    NSLog(@"%@", _modelName);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == AlertViewIndexPortName) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            alertView.delegate = nil;

            [self.navigationController popViewControllerAnimated:YES];
        } else {
            _portName = [alertView textFieldAtIndex:0].text;

            if ([_portName isEqualToString:@""]) {
                UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Please enter the port name."
                                                                        message:@"Fill in the port name."
                                                                       delegate:self cancelButtonTitle:@"Cancel"
                                                              otherButtonTitles:@"OK", nil];

                nestAlertView.tag            = AlertViewIndexPortName;
                nestAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;

                [nestAlertView textFieldAtIndex:0].text = [AppDelegate getPortName];

                [nestAlertView show];
            } else {
                UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Please enter the port settings."
                                                                        message:nil delegate:self
                                                              cancelButtonTitle:@"Cancel"
                                                              otherButtonTitles:@"OK", nil];

                nestAlertView.tag            = AlertViewIndexPortSettings;
                nestAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;

                [nestAlertView textFieldAtIndex:0].text = [AppDelegate getPortSettings];

                [nestAlertView show];
            }
        }
    } else if (alertView.tag == AlertViewIndexPortSettings) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            alertView.delegate = nil;

            [self.navigationController popViewControllerAnimated:YES];
        } else {
            _portSettings = [alertView textFieldAtIndex:0].text;

            UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Confirm."
                                                                    message:@"What is your printer?"
                                                                   delegate:self cancelButtonTitle:@"Cancel"
                                                          otherButtonTitles:nil];

            for (int i = 0; i < [ModelCapability modelIndexCount]; i++) {
                [nestAlertView addButtonWithTitle:[ModelCapability titleAtModelIndex:[ModelCapability modelIndexAtIndex:i]]];
            }

            nestAlertView.tag = AlertViewIndexModelSelect1;

            [nestAlertView show];
        }
    } else if (alertView.tag == AlertViewIndexModelConfirm) {
        if (buttonIndex == 1) {     // YES!!!
            NSArray *cellParam = _cellArray[_selectedIndexPath.row];

            _portName   = cellParam[CellParamIndexPortName];
            _modelName  = cellParam[CellParamIndexModelName];
            _macAddress = cellParam[CellParamIndexMacAddress];

            ModelIndex modelIndex = [ModelCapability modelIndexAtModelName:_modelName];

            _portSettings = [ModelCapability portSettingsAtModelIndex:modelIndex];
            _emulation    = [ModelCapability emulationAtModelIndex   :modelIndex];

            if ([ModelCapability cashDrawerOpenActiveAtModelIndex:modelIndex]) {
                UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Select CashDrawer Open Status."
                                                                        message:@""
                                                                       delegate:self
                                                              cancelButtonTitle:@"Cancel"
                                                              otherButtonTitles:@"High when Open", @"Low when Open", nil];

                nestAlertView.tag = AlertViewIndexCashDrawerOpenActive;

                [nestAlertView show];
            } else {
                [AppDelegate setPortName                :_portName];
                [AppDelegate setPortSettings            :_portSettings];
                [AppDelegate setModelName               :_modelName];
                [AppDelegate setMacAddress              :_macAddress];
                [AppDelegate setEmulation               :_emulation];
                [AppDelegate setCashDrawerOpenActiveHigh:YES];

                alertView.delegate = nil;

                [self.navigationController popViewControllerAnimated:YES];
            }
        } else {     // NO!!!
            UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Confirm." message:@"What is your printer?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];

            for (int i = 0; i < [ModelCapability modelIndexCount]; i++) {
                [nestAlertView addButtonWithTitle:[ModelCapability titleAtModelIndex:[ModelCapability modelIndexAtIndex:i]]];
            }

            nestAlertView.tag = AlertViewIndexModelSelect0;

            [nestAlertView show];
        }
    }
    else if (alertView.tag == AlertViewIndexModelSelect0) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            NSArray *cellParam = _cellArray[_selectedIndexPath.row];

            _portName   = cellParam[CellParamIndexPortName];
            _modelName  = cellParam[CellParamIndexModelName];
            _macAddress = cellParam[CellParamIndexMacAddress];

            ModelIndex modelIndex = [ModelCapability modelIndexAtIndex:buttonIndex - 1];

            _portSettings = [ModelCapability portSettingsAtModelIndex:modelIndex];
            _emulation    = [ModelCapability emulationAtModelIndex   :modelIndex];

            if ([ModelCapability cashDrawerOpenActiveAtModelIndex:modelIndex] == YES) {
                UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Select CashDrawer Open Status."
                                                                        message:@""
                                                                       delegate:self
                                                              cancelButtonTitle:@"Cancel"
                                                              otherButtonTitles:@"High when Open", @"Low when Open", nil];

                nestAlertView.tag = AlertViewIndexCashDrawerOpenActive;

                [nestAlertView show];
            }
            else {
                [AppDelegate setPortName                :_portName];
                [AppDelegate setPortSettings            :_portSettings];
                [AppDelegate setModelName               :_modelName];
                [AppDelegate setMacAddress              :_macAddress];
                [AppDelegate setEmulation               :_emulation];
                [AppDelegate setCashDrawerOpenActiveHigh:YES];

                alertView.delegate = nil;

                [self.navigationController popViewControllerAnimated:YES];
            }
        }
    } else if (alertView.tag == AlertViewIndexModelSelect1) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            ModelIndex modelIndex = [ModelCapability modelIndexAtIndex:buttonIndex - 1];

            _modelName    = [ModelCapability titleAtModelIndex       :modelIndex];
            _macAddress   = _portSettings;                                             // for display.
            //          _portSettings = [ModelCapability portSettingsAtModelIndex:modelIndex];
            _emulation    = [ModelCapability emulationAtModelIndex   :modelIndex];

            if ([ModelCapability cashDrawerOpenActiveAtModelIndex:modelIndex] == YES) {
                UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Select CashDrawer Open Status."
                                                                        message:@""
                                                                       delegate:self
                                                              cancelButtonTitle:@"Cancel"
                                                              otherButtonTitles:@"High when Open", @"Low when Open", nil];

                nestAlertView.tag = AlertViewIndexCashDrawerOpenActive;

                [nestAlertView show];
            }
            else {
                [AppDelegate setPortName                :_portName];
                [AppDelegate setPortSettings            :_portSettings];
                [AppDelegate setModelName               :_modelName];
                [AppDelegate setMacAddress              :_macAddress];
                [AppDelegate setEmulation               :_emulation];
                [AppDelegate setCashDrawerOpenActiveHigh:YES];

                alertView.delegate = nil;

                [self.navigationController popViewControllerAnimated:YES];
            }
        }
    }
    else if (alertView.tag == AlertViewIndexCashDrawerOpenActive) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            [AppDelegate setPortName    :_portName];
            [AppDelegate setPortSettings:_portSettings];
            [AppDelegate setModelName   :_modelName];
            [AppDelegate setMacAddress  :_macAddress];
            [AppDelegate setEmulation   :_emulation];

            if (buttonIndex == 1) {     // High when Open
                [AppDelegate setCashDrawerOpenActiveHigh:YES];
            }
            else if (buttonIndex == 2) {     // Low when Open
                [AppDelegate setCashDrawerOpenActiveHigh:NO];
            }

            alertView.delegate = nil;

            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (alertView.tag == AlertViewIndexRefreshPort) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            alertView.delegate = nil;

            [self.navigationController popViewControllerAnimated:YES];
        } else if (buttonIndex == 5) {     // Manual
            UIAlertView *nestAlertView = [[UIAlertView alloc] initWithTitle:@"Please enter the port name."
                                                                    message:nil
                                                                   delegate:self cancelButtonTitle:@"Cancel"
                                                          otherButtonTitles:@"OK", nil];

            nestAlertView.tag            = AlertViewIndexPortName;
            nestAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;

            [nestAlertView textFieldAtIndex:0].text = [AppDelegate getPortName];

            [nestAlertView show];
        } else {
            self.blind = YES;

            [_cellArray removeAllObjects];

            _selectedIndexPath = nil;

            NSArray *portInfoArray;

            switch (buttonIndex) {
                default :
                    //              case 1  :     // LAN
                    portInfoArray = [SMPort searchPrinter:@"TCP:"];
                    break;
                case 2  :     // Bluetooth
                    portInfoArray = [SMPort searchPrinter:@"BT:"];
                    break;
                case 3  :     // Bluetooth Low Energy
                    portInfoArray = [SMPort searchPrinter:@"BLE:"];
                    break;
                case 4  :     // All
                    portInfoArray = [SMPort searchPrinter];
                    break;
            }

            NSString *portName   = [AppDelegate getPortName];
            NSString *modelName  = [AppDelegate getModelName];
            NSString *macAddress = [AppDelegate getMacAddress];

            int row = 0;

            for (PortInfo *portInfo in portInfoArray) {
                [_cellArray addObject:@[portInfo.portName, portInfo.modelName, portInfo.macAddress]];

                if ([portInfo.portName   isEqualToString:portName]   == YES &&
                    [portInfo.modelName  isEqualToString:modelName]  == YES &&
                    [portInfo.macAddress isEqualToString:macAddress] == YES) {
                    _selectedIndexPath = [NSIndexPath indexPathForRow:row inSection:0];
                }

                row++;
            }

            [_tableView reloadData];

            self.blind = NO;
        }
    }
}

-(void)closeAlertview {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}


@end
