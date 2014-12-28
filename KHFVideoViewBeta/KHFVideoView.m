//
//  KHFVideoView.m
//  VideoView
//
//  Created by obumin on 2014/12/28.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "KHFVideoView.h"

@interface KHFVideoView ()

@property (strong, nonatomic) AVPlayer *videoPlayer;

@end

@implementation KHFVideoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setup
{
    
}

- (instancetype)initWithVideo:(KHFVideo *)video
{
    self = [super init];
    if (self) {
        self.video = video;
    }
    return self;
}

+ (Class)layerClass
{
    return [AVPlayerLayer class];
}

- (void)setVideo:(KHFVideo *)video
{
    if (video) {
        NSURL *url = [NSURL URLWithString:video.name];
        NSInteger length = [[url lastPathComponent] length] - [url pathExtension].length - 1;
        NSString *baseFilename = [[url lastPathComponent] substringToIndex:length];
        NSString *moviePath = [[NSBundle mainBundle] pathForResource:baseFilename ofType:[url pathExtension]];
        
        if (moviePath) {
            NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
            
            _videoPlayer = [[AVPlayer alloc] initWithURL:movieURL];
            AVPlayerLayer* layer = ( AVPlayerLayer* )self.layer;
            layer.videoGravity = AVLayerVideoGravityResizeAspect;
            layer.player       = _videoPlayer;
            
            layer.cornerRadius = 16.0;
        }
    }
}

- (void)play
{
    [_videoPlayer play];
}

- (void)pause
{
    [_videoPlayer pause];
}

- (void)stop
{
    [_videoPlayer pause];
    [_videoPlayer seekToTime:kCMTimeZero];
}
@end
