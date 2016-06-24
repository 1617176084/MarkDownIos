//
//  ViewController.m
//  MarkDownIos
//
//  Created by 黄燕 on 16/6/24.
//  Copyright © 2016年 Mr.Wang. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  [self loadHtml];
}
- (void)loadHtml {

  NSString *filePath =
      [[NSBundle mainBundle] pathForResource:@"help" ofType:@"txt"];

  NSString *htmlString = [NSString stringWithContentsOfFile:filePath
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];
  _markDownTextV.text = htmlString;

  //  [_webV loadRequest:[NSURLRequest
  //                         requestWithURL:
  //                             [NSURL
  //                             URLWithString:@"https://www.baidu.com"]]];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender {
  NSString *markDownTextV = _markDownTextV.text;

  JSContext *context = [_webV
      valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
  //  context[@"alertContent"] = markDownTextV;
  //  [context evaluateScript:@"showAlert();"];

  context[@"markdowntext"] = markDownTextV;
  [context evaluateScript:@"showMarkdowntext();"];
}
- (IBAction)previewClick:(id)sender {
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"preview"]) {
    ShowMatrDownHmlVC *view =
        (ShowMatrDownHmlVC *)segue.destinationViewController;
    view.markDownText = _markDownTextV.text;
  }
}
@end
