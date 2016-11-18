//
//  MainViewController.m
//  ObjectiveC SDK
//
//  Created by Yuji on 2015/**/**.
//  Copyright (c) 2015年 Star Micronics. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "ModelCapability.h"
#import "Communication.h"

typedef NS_ENUM(NSInteger, SectionIndex) {
    SectionIndexDevice = 0,
    SectionIndexPrinter,
    SectionIndexCashDrawer,
    SectionIndexBarcodeReader,
    SectionIndexCombination,
    SectionIndexApi,
    SectionIndexAllReceipts,
    SectionIndexDeviceStatus,
    SectionIndexAppendixBluetooth
};

typedef NS_ENUM(NSInteger, AlertViewIndex) {
    AlertViewIndexLanguage = 0,
    AlertViewIndexLanguageFixedPaperSize,
    AlertViewIndexPaperSize,
    AlertViewIndexConfirm
};

@interface MainViewController ()

@property (nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"F The Line Control Panel";;
    _selectedIndexPath = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

#pragma mark - Navigation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SectionIndexAppendixBluetooth + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 8) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;

    if (indexPath.section == SectionIndexDevice) {
        if ([[AppDelegate getModelName] isEqualToString:@""]) {
            static NSString *CellIdentifier = @"UITableViewCellStyleValue1";

            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                              reuseIdentifier:CellIdentifier];
            } else {
                cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
                cell.textLabel.text = @"Unselected State";
                cell.detailTextLabel.text = @"";
                cell.textLabel.textColor = [UIColor redColor];
                cell.detailTextLabel.textColor = [UIColor redColor];
                [UIView beginAnimations:nil context:nil];

                cell.textLabel.alpha = 0.0;
                cell.detailTextLabel.alpha = 0.0;
                [UIView setAnimationDelay:0.0];     // 0mS!!!
                [UIView setAnimationDuration:0.6];  // 600mS!!!
                [UIView setAnimationRepeatCount:UINT32_MAX];
                [UIView setAnimationRepeatAutoreverses:YES];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];

                cell.textLabel.alpha = 1.0;
                cell.detailTextLabel.alpha = 1.0;
                [UIView commitAnimations];

                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.userInteractionEnabled = YES;
            }
        } else {
            static NSString *CellIdentifier = @"UITableViewCellStyleSubtitle";

            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:CellIdentifier];
            }

            if (cell != nil) {
                cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.7 blue:1.0 alpha:1.0];
                cell.textLabel.text = [AppDelegate getModelName];
                if ([[AppDelegate getMacAddress] isEqualToString:@""]) {
                    cell.detailTextLabel.text = [AppDelegate getPortName];
                } else {
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%@)",
                                                 [AppDelegate getPortName], [AppDelegate getMacAddress]];
                }

                cell.textLabel.textColor = [UIColor blueColor];
                cell.detailTextLabel.textColor = [UIColor blueColor];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
        }
    } else {
        static NSString *CellIdentifier = @"UITableViewCellStyleValue1";

        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                          reuseIdentifier:CellIdentifier];
        }

        if (cell != nil) {
            switch (indexPath.section) {
                case SectionIndexBarcodeReader :
                case SectionIndexCombination   :
                    cell.backgroundColor = [UIColor whiteColor];

                    cell.textLabel.text = @"StarIoExtManager Sample";
                    cell.detailTextLabel.text = @"";

                    cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
                    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
                    break;
                case SectionIndexApi :
                    cell.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:1.0 alpha:1.0];

                    cell.textLabel.text = @"Sample";
                    cell.detailTextLabel.text = @"";

                    cell.textLabel.textColor = [UIColor blueColor];
                    cell.detailTextLabel.textColor = [UIColor blueColor];
                    break;
                case SectionIndexAllReceipts :
                    cell.backgroundColor = [UIColor colorWithRed:0.8 green:1.0 blue:0.9 alpha:1.0];

                    cell.textLabel.text = @"Sample";
                    cell.detailTextLabel.text = @"";

                    cell.textLabel.textColor = [UIColor blueColor];
                    cell.detailTextLabel.textColor = [UIColor blueColor];
                    break;
                case SectionIndexAppendixBluetooth :
                    cell.backgroundColor = [UIColor whiteColor];

                    if (indexPath.row == 0) {
                        cell.textLabel.text = @"Pairing and Connect Bluetooth";
                        cell.detailTextLabel.text = @"";
                    } else {
                        cell.textLabel.text = @"Disconnect Bluetooth";
                        cell.detailTextLabel.text = @"";
                    }

                    cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
                    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
                    break;

                default:
                    //              case SectionIndexPrinter      :
                    //              case SectionIndexCashDrawer   :
                    //              case SectionIndexDeviceStatus :
                    cell.backgroundColor = [UIColor whiteColor];
                    cell.textLabel.text = @"Sample";
                    cell.detailTextLabel.text = @"";
                    cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
                    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
                    break;
            }

            BOOL userInteractionEnabled = YES;

            if ([[AppDelegate getModelName] isEqualToString:@""]) {
                userInteractionEnabled = NO;
            }

            StarIoExtEmulation emulation = [AppDelegate getEmulation];

            if (emulation == StarIoExtEmulationStarLine    ||
                emulation == StarIoExtEmulationStarGraphic ||
                emulation == StarIoExtEmulationEscPos) {
                if (indexPath.section == SectionIndexBarcodeReader ||
                    indexPath.section == SectionIndexCombination) {
                    userInteractionEnabled = NO;
                }
            }

            if (emulation == StarIoExtEmulationEscPosMobile) {
                if (indexPath.section == SectionIndexCashDrawer    ||
                    indexPath.section == SectionIndexBarcodeReader ||
                    indexPath.section == SectionIndexCombination) {
                    userInteractionEnabled = NO;
                }
            }

            if (emulation == StarIoExtEmulationStarDotImpact) {
                if (indexPath.section == SectionIndexBarcodeReader ||
                    indexPath.section == SectionIndexCombination   ||
                    indexPath.section == SectionIndexAllReceipts) {
                    userInteractionEnabled = NO;
                }
            }

            if (indexPath.section == SectionIndexAppendixBluetooth) {
                if (indexPath.row == 1) {     // Only Disconnect Bluetooth
                    if ([[AppDelegate getPortName] hasPrefix:@"BT:"] == NO) {
                        userInteractionEnabled = NO;
                    }
                }
            }

            if (userInteractionEnabled) {
                cell.textLabel.alpha = 1.0;
                cell.detailTextLabel.alpha = 1.0;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.userInteractionEnabled = YES;
            } else {
                cell.textLabel.alpha = 0.3;
                cell.detailTextLabel.alpha = 0.3;
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.userInteractionEnabled = NO;
            }
        }
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"";

    switch (section) {
        default                 :
            //      case SectionIndexDevice :
            title = @"Destination Device";
            break;
        case SectionIndexPrinter :
            title = @"Printer";
            break;
        case SectionIndexCashDrawer :
            title = @"Cash Drawer";
            break;
        case SectionIndexBarcodeReader :
            title = @"Barcode Reader (for mPOP)";
            break;
        case SectionIndexCombination :
            title = @"Combination (for mPOP)";
            break;
        case SectionIndexApi :
            title = @"API";
            break;
        case SectionIndexAllReceipts :
            title = @"AllReceipts";
            break;
        case SectionIndexDeviceStatus :
            title = @"Device Status";
            break;
        case SectionIndexAppendixBluetooth :
            title = @"Appendix (Bluetooth)";
            break;
    }
    return title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];

    _selectedIndexPath = indexPath;

    switch (_selectedIndexPath.section) {
        case SectionIndexPrinter:
            [self selectLanguage];
            break;

        case SectionIndexCashDrawer:
            [self performSegueWithIdentifier:@"PushCashDrawerViewController" sender:nil];
            break;

        case SectionIndexBarcodeReader:
        case SectionIndexCombination:
            break;

        case SectionIndexApi:
            if ([AppDelegate getEmulation] == StarIoExtEmulationEscPos) {
                [AppDelegate setSelectedPaperSize:PaperSizeIndexEscPosThreeInch];

                [self performSegueWithIdentifier:@"PushApiViewController" sender:nil];
            } else if ([AppDelegate getEmulation] == StarIoExtEmulationStarDotImpact) {
                [AppDelegate setSelectedPaperSize:PaperSizeIndexDotImpactThreeInch];

                [self performSegueWithIdentifier:@"PushApiViewController" sender:nil];
            } else {
                [self selectPaperSize];
            }
            break;

        case SectionIndexAllReceipts:
            [self selectLanguage];
            break;

        case SectionIndexDeviceStatus:
            [self performSegueWithIdentifier:@"PushDeviceStatusViewController" sender:nil];
            break;

        case SectionIndexAppendixBluetooth :
            if (_selectedIndexPath.row == 0) {
                [Communication connectBluetooth];
            } else {
                self.blind = YES;

                [Communication disconnectBluetooth:[AppDelegate getModelName]
                                          portName:[AppDelegate getPortName]
                                      portSettings:[AppDelegate getPortSettings]
                                           timeout:10000];     // 10000mS!!!

                self.blind = NO;
            }
            break;

        default:
            [self performSegueWithIdentifier:@"PushSearchPortViewController"
                                      sender:nil];
            break;
    }
}

-(void) selectLanguage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Select language."
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    [alertController addAction:[UIAlertAction actionWithTitle:@"English"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self englishSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"Japanese"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self japaneseSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"Portuguese"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self portugueseSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"Spanish"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self spanishSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"German"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self germanSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"Russian"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self russianSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"Simplified Chinese"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self simplifiedChineseSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"Traditional Chinese"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self traditionalChineseSelected];
                                                      }]];

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

-(void)japaneseSelected {
    [self closeAlertview];
}

-(void)englishSelected {
    [self closeAlertview];
}

-(void)frenchSelected {
    [self closeAlertview];
}

-(void)portugueseSelected {
    [self closeAlertview];
}

-(void)spanishSelected {
    [self closeAlertview];
}

-(void)germanSelected {
    [self closeAlertview];
}

-(void)russianSelected {
    [self closeAlertview];
}

-(void)simplifiedChineseSelected {
    [self closeAlertview];
}

-(void)traditionalChineseSelected {
    [self closeAlertview];
}

-(void) selectPaperSize {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Select paper size."
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    [alertController addAction:[UIAlertAction actionWithTitle:@"2\" (384dots)"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self twoInchSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"3\" (576dots)"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self threeInchSelected];
                                                      }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"4\" (832dots)"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self fourInchSelected];
                                                      }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self closeAlertview];
                                                      }]];
}

-(void)twoInchSelected {
    [self closeAlertview];
}

-(void)threeInchSelected {
    [self closeAlertview];
}

-(void)fourInchSelected {
    [self closeAlertview];
}

-(void)closeAlertview {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
