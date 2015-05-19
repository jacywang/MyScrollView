//
//  ViewController.m
//  MyScrollView
//
//  Created by JIAN WANG on 5/19/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CGRect rectDown = self.view.bounds;
//    rectDown.origin.y += 100;
//    self.view.bounds = rectDown;
    CGRect rect = self.view.bounds;
    self.scrollView = [[MyScrollView alloc] initWithFrame:rect];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollView:)];
    
    [self.scrollView addGestureRecognizer:panGesture];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor blueColor];
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:redView];
    [self.scrollView addSubview:greenView];
    [self.scrollView addSubview:blueView];
    [self.scrollView addSubview:yellowView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)moveScrollView:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint translation= [sender translationInView:self.view];
        CGRect rect = self.scrollView.bounds;
        rect.origin.y += translation.y;
        self.scrollView.bounds = rect;
    }
    NSLog(@"%f", self.scrollView.bounds.origin.y);
}

@end
