//
//  code128.h
//  IOS_SDK
//
//  Created by Tzvi on 8/8/11.
//  Copyright 2011 - 2013 STAR MICRONICS CO., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface code128 : UIViewController <UITextFieldDelegate> {
    IBOutlet UIView *uiview_block;
    
    IBOutlet UIImageView *uiimageview_barcode;

    IBOutlet UITextField *uitextfield_height;
    IBOutlet UITextField *uitextfield_data;

    IBOutlet UIButton *buttonWidth;
    IBOutlet UIButton *buttonLayout;
    IBOutlet UIButton *buttonBack;
    IBOutlet UIButton *buttonHelp;
    IBOutlet UIButton *buttonPrint;

    NSInteger selectedWidth;
    NSInteger selectedLayout;

    NSArray *array_width;
    NSArray *array_layout;
}

- (IBAction)selectWidth:(id)sender;
- (IBAction)selectLayout:(id)sender;

- (IBAction)backCode128;
- (IBAction)showHelp;
- (IBAction)printBarcode128;

@end
