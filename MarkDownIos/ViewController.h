//
//  ViewController.h
//  MarkDownIos
//
//  Created by 黄燕 on 16/6/24.
//  Copyright © 2016年 Mr.Wang. All rights reserved.
//

#import "ShowMatrDownHmlVC.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIWebView *webV;
@property(weak, nonatomic) IBOutlet UITextView *markDownTextV;

- (IBAction)btnClick:(id)sender;

@end
