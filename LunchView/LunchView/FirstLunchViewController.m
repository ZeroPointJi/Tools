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

#define kScreenFrame [UIScreen mainScreen].bounds
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface FirstLunchViewController () <UIScrollViewDelegate>

/** 动画体 */
@property (nonatomic, strong) FirstLunchAnimator *animator;
/** 滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 指示器 */
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation FirstLunchViewController

- (NSArray *)scrollViewArr
{
    if (!_scrollView) {
        self.scrollViewArr = [NSArray array];
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
    
    [self setupScrollView];
    
    [self setupPageControl];
    
    [self setupIntoButton];
}

/**
 *  初始化滚动视图
 */
- (void)setupScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:kScreenFrame];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(kScreenW * self.scrollViewArr.count, 0);
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    
    CGFloat current = 0;
    for (UIView *view in self.scrollViewArr) {
        view.frame = CGRectMake(current * kScreenW, 0, kScreenW, kScreenH);
        [_scrollView addSubview:view];
        current++;
    }
}

/**
 *  初始化页面指示器
 */
- (void)setupPageControl
{
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, kScreenH - 50, kScreenW, 50)];
    _pageControl.numberOfPages = self.scrollViewArr.count;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    [_pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
}

/**
 *  调整输入按钮位置
 */
- (void)setupIntoButton
{
    _intoButton.center = CGPointMake((self.scrollViewArr.count - 1) * kScreenW + kScreenW / 2, kScreenH - 200);
    [_intoButton addTarget:self action:@selector(presentToLunchVC) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_intoButton];
}

/**
 *  按钮点击事件
 */
- (void)presentToLunchVC
{
    self.presentViewController.transitioningDelegate = self.animator;
    self.presentViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:self.presentViewController animated:YES completion:nil];
}

/**
 *  指示器事件
 *
 *  @param pageControl 指示器
 */
- (void)pageControlValueChanged:(UIPageControl *)pageControl
{
    CGFloat offsetx = pageControl.currentPage;
    self.scrollView.contentOffset = CGPointMake(offsetx * kScreenW, 0);
}

/**
 *  滚动事件
 *
 *  @param scrollView 滚动视图
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetx = scrollView.contentOffset.x;
    self.pageControl.currentPage = (int)(offsetx / kScreenW  + 0.5);
}

@end