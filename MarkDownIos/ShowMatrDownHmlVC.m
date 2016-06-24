//
//  ShowMatrDownHmlVC.m
//  MarkDownIos
//
//  Created by 黄燕 on 16/6/24.
//  Copyright © 2016年 Mr.Wang. All rights reserved.
//

#import "ShowMatrDownHmlVC.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface ShowMatrDownHmlVC ()

@end

@implementation ShowMatrDownHmlVC

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self loadHtml];
}
- (void)loadHtml {

  NSString *filePath =
      [[NSBundle mainBundle] pathForResource:@"ShowHtml" ofType:@"html"];

  NSString *htmlString = [NSString stringWithContentsOfFile:filePath
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];
  // 获取当前应用的根目录
  NSString *path = [[NSBundle mainBundle] bundlePath];
  NSURL *baseURL = [NSURL fileURLWithPath:path];
  NSURL *htmlBaseUrl = [NSURL URLWithString:filePath];
  [_webView loadHTMLString:htmlString baseURL:baseURL];

  //  [_webV loadRequest:[NSURLRequest
  //                         requestWithURL:
  //                             [NSURL
  //                             URLWithString:@"https://www.baidu.com"]]];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
#pragma mark - delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {

  JSContext *context = [_webView
      valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
  //  context[@"alertContent"] = markDownTextV;
  //  [context evaluateScript:@"showAlert();"];

  context[@"markdowntext"] = _markDownText;
  [context evaluateScript:@"showMarkdowntext();"];
}
- (IBAction)backClick:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
