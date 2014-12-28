//
//  ViewController.m
//  KHFVideoViewBeta
//
//  Created by obumin on 2014/12/28.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "ViewController.h"
#import "KHFVideoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KHFVideo *video = [KHFVideo videoNamed:@"sample.mp4"];
    KHFVideoView *videoView = [[KHFVideoView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [videoView setVideo:video];
    [self.view addSubview:videoView];
    
    [videoView play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
