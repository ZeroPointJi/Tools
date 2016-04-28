//
//  FirstLunchViewController.m
//  LunchView
//
//  Created by zero on 16/4/27.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "FirstLunchViewController.h"
#import "MainViewController.h"
#import "FirstLunchAnimator.h"
#import "UIImageView+WebCache.h"

@interface FirstLunchViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) FirstLunchAnimator *animator;
@property (nonatomic, strong) NSMutableArray *scrollViewArr;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation FirstLunchViewController

- (NSMutableArray *)scrollViewArr
{
    if (!_scrollViewArr) {
        self.scrollViewArr = [NSMutableArray array];
    }
    return _scrollViewArr;
}

- (FirstLunchAnimator *)animator
{
    if (!_animator) {
        self.animator = [[FirstLunchAnimator alloc] init];
    }
    
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = self.view.center;
    [button setTitle:@"引导界面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(presentToLunchVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self setupLunchView];
}

- (void)setupLunchView
{
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    CGFloat screenW = screenFrame.size.width;
    CGFloat screenH = screenFrame.size.height;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:screenFrame];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(screenFrame.size.width * self.scrollViewArr.count, 0);
    [self.view addSubview:_scrollView];
    
    CGFloat current = 0;
    for (UIView *view in self.scrollViewArr) {
        view.frame = CGRectMake(current * screenW, 0, screenW, screenH);
        [_scrollView addSubview:view];
        current++;
    }
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, screenH - 50, screenW, 50)];
    _pageControl.numberOfPages = self.scrollViewArr.count;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    [_pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
}

- (void)presentToLunchVC
{
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.transitioningDelegate = self.animator;
    mainVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:mainVC animated:YES completion:nil];
}

- (void)pageControlValueChanged:(UIPageControl *)pageControl
{
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    CGFloat screenW = screenFrame.size.width;
    
    CGFloat offsetx = pageControl.currentPage;
    self.scrollView.contentOffset = CGPointMake(offsetx * screenW, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetx = scrollView.contentOffset.x;
    self.pageControl.currentPage = (int)(offsetx / 2 + 0.5);
}

@end