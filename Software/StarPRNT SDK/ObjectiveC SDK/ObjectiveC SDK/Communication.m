//
//  Communication.m
//  ObjectiveC SDK
//
//  Created by Yuji on 2015/**/**.
//  Copyright (c) 2015年 Star Micronics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Communication.h"

@implementation Communication

+ (BOOL)sendCommands:(NSData *)commands port:(SMPort *)port {
    BOOL result = NO;
    
    NSString *title   = @"";
    NSString *message = @"";
    
    uint32_t commandLength = (uint32_t) commands.length;
    
    unsigned char *commandsBytes = (unsigned char *) commands.bytes;
    
    @try {
        while (YES) {
            if (port == nil) {
                title = @"Fail to Open Port";
                break;
            }
            
            StarPrinterStatus_2 printerStatus;
            
            [port beginCheckedBlock:&printerStatus :2];
            
            if (printerStatus.offline == SM_TRUE) {
                title   = @"Printer Error";
                message = @"Printer is offline (BeginCheckedBlock)";
                break;
            }
            
            NSDate *startDate = [NSDate date];
            
            uint32_t total = 0;
            
            while (total < commandLength) {
                uint32_t written = [port writePort:commandsBytes :total :commandLength - total];
                
                total += written;
                
                if ([[NSDate date] timeIntervalSinceDate:startDate] >= 30.0) {     // 30000mS!!!
                    break;
                }
            }
            
            if (total < commandLength) {
                title   = @"Printer Error";
                message = @"Write port timed out";
                break;
            }
            
            port.endCheckedBlockTimeoutMillis = 30000;     // 30000mS!!!
            
            [port endCheckedBlock:&printerStatus :2];
            
            if (printerStatus.offline == SM_TRUE) {
                title   = @"Printer Error";
                message = @"Printer is offline (endCheckedBlock)";
                break;
            }
            
            title   = @"Send Commands";
            message = @"Success";
            
            result = YES;
            break;
        }
    }
    @catch (PortException *exc) {
        title   = @"Printer Error";
        message = @"Write port timed out (PortException)";
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    });
    
    return result;
}

+ (BOOL)sendCommandsDoNotCheckCondition:(NSData *)commands port:(SMPort *)port {
    BOOL result = NO;
    
    NSString *title   = @"";
    NSString *message = @"";
    
    uint32_t commandLength = (uint32_t) commands.length;
    
    unsigned char *commandsBytes = (unsigned char *) commands.bytes;
    
    @try {
        while (YES) {
            if (port == nil) {
                title = @"Fail to Open Port";
                break;
            }
            
            StarPrinterStatus_2 printerStatus;
            
            [port getParsedStatus:&printerStatus :2];
            
//          if (printerStatus.offline == SM_TRUE) {     // Do not check condition.
//              title   = @"Printer Error";
//              message = @"Printer is offline (BeginCheckedBlock)";
//              break;
//          }
            
            NSDate *startDate = [NSDate date];
            
            uint32_t total = 0;
            
            while (total < commandLength) {
                uint32_t written = [port writePort:commandsBytes :total :commandLength - total];
                
                total += written;
                
                if ([[NSDate date] timeIntervalSinceDate:startDate] >= 30.0) {     // 30000mS!!!
                    break;
                }
            }
            
            if (total < commandLength) {
                title   = @"Printer Error";
                message = @"Write port timed out";
                break;
            }
            
            [port getParsedStatus:&printerStatus :2];
            
//          if (printerStatus.offline == SM_TRUE) {     // Do not check condition.
//              title   = @"Printer Error";
//              message = @"Printer is offline (endCheckedBlock)";
//              break;
//          }
            
            title   = @"Send Commands";
            message = @"Success";
            
            result = YES;
            break;
        }
    }
    @catch (PortException *exc) {
        title   = @"Printer Error";
        message = @"Write port timed out (PortException)";
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    });
    
    return result;
}

+ (BOOL)sendCommands:(NSData *)commands portName:(NSString *)portName portSettings:(NSString *)portSettings timeout:(NSInteger)timeout {
    BOOL result = NO;
    
    NSString *title   = @"";
    NSString *message = @"";
    
    if (timeout > UINT32_MAX) {
        timeout = UINT32_MAX;
    }
    
    uint32_t commandLength = (uint32_t) commands.length;
    
    unsigned char *commandsBytes = (unsigned char *) commands.bytes;
    
    SMPort *port = nil;
    
    @try {
        while (YES) {
            port = [SMPort getPort:portName :portSettings :(uint32_t) timeout];
            
            if (port == nil) {
                title = @"Fail to Open Port";
                break;
            }
            
            StarPrinterStatus_2 printerStatus;
            
            [port beginCheckedBlock:&printerStatus :2];
            
            if (printerStatus.offline == SM_TRUE) {
                title   = @"Printer Error";
                message = @"Printer is offline (BeginCheckedBlock)";
                break;
            }
            
            NSDate *startDate = [NSDate date];
            
            uint32_t total = 0;
            
            while (total < commandLength) {
                uint32_t written = [port writePort:commandsBytes :total :commandLength - total];
                
                total += written;
                
                if ([[NSDate date] timeIntervalSinceDate:startDate] >= 30.0) {     // 30000mS!!!
                    break;
                }
            }
            
            if (total < commandLength) {
                title   = @"Printer Error";
                message = @"Write port timed out";
                break;
            }
            
            port.endCheckedBlockTimeoutMillis = 30000;     // 30000mS!!!
            
            [port endCheckedBlock:&printerStatus :2];
            
            if (printerStatus.offline == SM_TRUE) {
                title   = @"Printer Error";
                message = @"Printer is offline (endCheckedBlock)";
                break;
            }
            
            title   = @"Send Commands";
            message = @"Success";
            
            result = YES;
            break;
        }
    }
    @catch (PortException *exc) {
        title   = @"Printer Error";
        message = @"Write port timed out (PortException)";
    }
    @finally {
        if (port != nil) {
            [SMPort releasePort:port];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    });
    
    return result;
}

+ (BOOL)sendCommandsDoNotCheckCondition:(NSData *)commands portName:(NSString *)portName portSettings:(NSString *)portSettings timeout:(NSInteger)timeout {
    BOOL result = NO;
    
    NSString *title   = @"";
    NSString *message = @"";
    
    if (timeout > UINT32_MAX) {
        timeout = UINT32_MAX;
    }
    
    uint32_t commandLength = (uint32_t) commands.length;
    
    unsigned char *commandsBytes = (unsigned char *) commands.bytes;
    
    SMPort *port = nil;
    
    @try {
        while (YES) {
            port = [SMPort getPort:portName :portSettings :(uint32_t) timeout];
            
            if (port == nil) {
                title = @"Fail to Open Port";
                break;
            }
            
            StarPrinterStatus_2 printerStatus;
            
            [port getParsedStatus:&printerStatus :2];
            
//          if (printerStatus.offline == SM_TRUE) {     // Do not check condition.
//              title   = @"Printer Error";
//              message = @"Printer is offline (BeginCheckedBlock)";
//              break;
//          }
            
            NSDate *startDate = [NSDate date];
            
            uint32_t total = 0;
            
            while (total < commandLength) {
                uint32_t written = [port writePort:commandsBytes :total :commandLength - total];
                
                total += written;
                
                if ([[NSDate date] timeIntervalSinceDate:startDate] >= 30.0) {     // 30000mS!!!
                    break;
                }
            }
            
            if (total < commandLength) {
                title   = @"Printer Error";
                message = @"Write port timed out";
                break;
            }
            
            [port getParsedStatus:&printerStatus :2];
            
//          if (printerStatus.offline == SM_TRUE) {     // Do not check condition.
//              title   = @"Printer Error";
//              message = @"Printer is offline (endCheckedBlock)";
//              break;
//          }
            
            title   = @"Send Commands";
            message = @"Success";
            
            result = YES;
            break;
        }
    }
    @catch (PortException *exc) {
        title   = @"Printer Error";
        message = @"Write port timed out (PortException)";
    }
    @finally {
        if (port != nil) {
            [SMPort releasePort:port];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    });
    
    return result;
}

+ (void)connectBluetooth {
    [[EAAccessoryManager sharedAccessoryManager] showBluetoothAccessoryPickerWithNameFilter:nil completion:^(NSError *error) {
        BOOL result;
        BOOL show;
        
        if (error != nil) {
            NSLog(@"Error:%@", error.description);
            
            switch (error.code) {
                case EABluetoothAccessoryPickerAlreadyConnected :
                    result = YES;
                    show   = YES;
                    break;
                case EABluetoothAccessoryPickerResultCancelled :
                case EABluetoothAccessoryPickerResultFailed    :
                    result = NO;
                    show   = NO;
                    break;
                default                                       :
//              case EABluetoothAccessoryPickerResultNotFound :
                    result = NO;
                    show   = YES;
                    break;
            }
        }
        else {
            result = YES;
            show   = YES;
        }
        
        if (show == YES) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alertView;
                
                if (result == YES) {
                    alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                }
                else {
                    alertView = [[UIAlertView alloc] initWithTitle:@"Fail to Connect" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                }
                
                [alertView show];
            });
        }
    }];
}

+ (BOOL)disconnectBluetooth:(NSString *)modelName portName:(NSString *)portName portSettings:(NSString *)portSettings timeout:(NSInteger)timeout {
    BOOL result = NO;
    
    SMPort *port = nil;
    
    @try {
        while (YES) {
            port = [SMPort getPort:portName :portSettings :(uint32_t) timeout];
            
            if (port == nil) {
                break;
            }
            
            if ([modelName hasPrefix:@"TSP143IIIBI"]) {
                unsigned char commandBytes[] = {0x1b, 0x1c, 0x26, 0x49};     // Only TSP143IIIBI
                
                uint32_t commandLength = sizeof(commandBytes);
                
                StarPrinterStatus_2 printerStatus;
                
                [port beginCheckedBlock:&printerStatus :2];
                
                if (printerStatus.offline == SM_TRUE) {
                    break;
                }
                
                NSDate *startDate = [NSDate date];
                
                uint32_t total = 0;
                
                while (total < commandLength) {
                    uint32_t written = [port writePort:commandBytes :total :commandLength - total];
                    
                    total += written;
                    
                    if ([[NSDate date] timeIntervalSinceDate:startDate] >= 30.0) {     // 30000mS!!!
                        break;
                    }
                }
                
                if (total < commandLength) {
                    break;
                }
                
//              port.endCheckedBlockTimeoutMillis = 30000;     // 30000mS!!!
//
//              [port endCheckedBlock:&printerStatus :2];
//
//              if (printerStatus.offline == SM_TRUE) {
//                  break;
//              }
            }
            else {
                if ([port disconnect] == NO) {
                    break;
                }
            }
        
            result = YES;
            break;
        }
    }
    @catch (PortException *exception) {
    }
    @finally {
        if (port != nil) {
            [SMPort releasePort:port];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView;
        
        if (result == YES) {
            alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        }
        else {
            alertView = [[UIAlertView alloc] initWithTitle:@"Fail to Disconnect" message:@"Note. Portable Printers is not supported." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        }
        
        [alertView show];
    });
    
    return result;
}

@end
