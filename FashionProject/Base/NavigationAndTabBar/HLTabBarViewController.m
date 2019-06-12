//
//  HLTabBarViewController.m
//  党建e家
//
//  Created by 何龙 on 2018/10/25.
//  Copyright © 2018 何龙. All rights reserved.
//

#import "HLTabBarViewController.h"
#import "HLNavigationViewController.h"//navigation
#import "CPIndexViewController.h"//首页根控制器
#import "CPPublishViewController.h"//发布根控制器
#import "CPMessageViewController.h"//消息根控制器
#import "CPMineViewController.h"//我的根控制器
@interface HLTabBarViewController ()
@property (nonatomic, assign) NSInteger  indexFlag;//记录上次点击的位置
@end

@implementation HLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = [UIColor whiteColor];
    _indexFlag = 0;
    /*  设置首页根控制器 */
    HLNavigationViewController *naV1 = [[HLNavigationViewController alloc] initWithRootViewController:[[CPIndexViewController alloc] init]];
    [self setTabBarUINavigation:naV1 andTitleName:@"集市" andImgName:@"门店_2" andSelectedImgName:@"门店_1"];
    [self addChildViewController:naV1];
    
    /*  设置发布根控制器 */
    HLNavigationViewController *naV2 = [[HLNavigationViewController alloc] initWithRootViewController:[[CPPublishViewController alloc] init]];
    [self setTabBarUINavigation:naV2 andTitleName:@"发布" andImgName:@"发布_1" andSelectedImgName:@"发布"];
    [self addChildViewController:naV2];
    
    /*  设置消息根控制器 */
    HLNavigationViewController *naV3 = [[HLNavigationViewController alloc] initWithRootViewController:[[CPMessageViewController alloc] init]];
    [self setTabBarUINavigation:naV3 andTitleName:@"消息" andImgName:@"消息_1" andSelectedImgName:@"消息"];
    [self addChildViewController:naV3];
    
    /*  设置我的控制器 */
    HLNavigationViewController *naV4 = [[HLNavigationViewController alloc] initWithRootViewController:[[CPMineViewController alloc] init]];
    [self setTabBarUINavigation:naV4 andTitleName:@"我的" andImgName:@"我的_1" andSelectedImgName:@"我的"];
    [self addChildViewController:naV4];
    
    self.selectedIndex = 0;
}


/**
 自定义方法，设置tabbar相关属性

 @param naV nav
 @param title title的名字
 @param name 正常图片的名字
 @param selectedName 选中图片的名字
 */
-(void)setTabBarUINavigation:(UINavigationController *)naV andTitleName:(NSString *)title andImgName:(NSString *)name andSelectedImgName:(NSString *)selectedName
{
    naV.tabBarItem.title = title;
    //设置正常状态下的tabbar title颜色和字体大小
    [naV.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0], NSFontAttributeName, nil] forState:(UIControlStateNormal)];
    //设置选中状态下的tabbar title颜色和字体大小
    [naV.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:HLRGBColor(98, 204, 223), NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0], NSFontAttributeName, nil] forState:(UIControlStateSelected)];
    
    //设置正常状态下的tabbar图标
    naV.tabBarItem.image = [[UIImage imageNamed:name] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    //设置选中状态下的tabbar图标
    naV.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
//    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arr = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arr addObject:btn];
            }
        }
        //放大效果
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;//执行时间
        animation.repeatCount = 1;//执行次数
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;//保证动画效果延续
        animation.fromValue = [NSNumber numberWithFloat:0.6];//初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.0];//结束伸缩倍数
        [[arr[index] layer] addAnimation:animation forKey:nil];
        //移除其他tabbar的动画
        for (int i = 0; i < arr.count; i++) {
            if (i != index) {
                [[arr[i] layer] removeAllAnimations];
            }
        }
        
        self.indexFlag = index;
//    }
}
@end
