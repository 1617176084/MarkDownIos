//
//  ShowMatrDownHmlVC.h
//  MarkDownIos
//
//  Created by 黄燕 on 16/6/24.
//  Copyright © 2016年 Mr.Wang. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
@interface ShowMatrDownHmlVC : UIViewController <UIWebViewDelegate>
@property(copy, nonatomic) NSString *markDownText;
@property(weak, nonatomic) IBOutlet UIWebView *webView;
@end
