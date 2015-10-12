//
//  ViewController.m
//  WebBrowser
//
//  Created by trendpower on 15/10/8.
//  Copyright © 2015年 Trendpower. All rights reserved.
//

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"

#import "WebViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField * textView;

@property (nonatomic, strong) UIButton * submitBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"web浏览器";
    
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.submitBtn];
}


- (UITextField *)textView{
    if(!_textView){
        _textView = ({
            UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, ScreenWidth - 20, 40)];
            textField.placeholder = @"输入网址";
            textField.layer.borderColor = [UIColor colorWithWhite:0.797 alpha:1.000].CGColor;
            textField.layer.borderWidth = 0.5f;
            textField;
        });
    }
    return _textView;
}


- (UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = ({
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/2 -75, CGRectGetMaxY(self.textView.frame)+50, 150, 44)];
         btn.backgroundColor = [UIColor colorWithRed:0.226 green:0.780 blue:1.000 alpha:1.000];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
         btn;
        });
    }
    return _submitBtn;
}


- (void)clickedBtn:(UIButton *)btn{
    
    NSString * url = self.textView.text;
    if(!url.length) url = @"m.baidu.com";
    
    if (![url hasPrefix:@"http://"]) {
        url = [NSString stringWithFormat:@"http://%@",url];
    }
    
    WebViewController * web = [[WebViewController alloc]init];
    web.url = url;
    web.title = @"web";
    [self.navigationController pushViewController:web animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
