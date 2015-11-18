//
//  BrandDetailViewController.m
//  BaseProject
//
//  Created by hanbo on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BrandDetailViewController.h"
#import "Factory.h"
@interface BrandDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)NSArray *urls;
@end

@implementation BrandDetailViewController
-(instancetype)initWithIndex:(NSInteger )index
{
    if (self=[super init]) {
        _index=index;
    }
    return self;
}
-(NSArray *)urls
{
    return @[@"http://home.fang.com/harborhouse",@"http://www.markorhome.com",@"http://home.fang.com/oulin",@"http://home.fang.com/qumei",@"http://home.fang.com/fine/",@"http://www.ikea.com/cn/zh"];
}
-(UIWebView *)webView
{
    if (!_webView) {
        _webView=[UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urls[_index]]]];
        _webView.delegate=self;
    }
    return _webView;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self hideProgress];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
//    [Factory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
