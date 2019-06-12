//
//  HLBaseViewController.m
//  FashionBrand
//
//  Created by 何龙 on 2019/6/4.
//  Copyright © 2019 何龙. All rights reserved.
//

#import "HLBaseViewController.h"

@interface HLBaseViewController ()

@end

@implementation HLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:19],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setBackgroundColor:HLRGBAColor(227, 74, 81, 0.9)];
    //设置导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = HLRGBColor(98, 204, 223);
    
    // Do any additional setup after loading the view.
}
-(void)changeTitle:(NSString *)title{
    self.title = title;
}
//重写侧滑协议
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return YES;
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
