//
//  KHFVideoView.m
//  VideoView
//
//  Created by obumin on 2014/12/28.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//
//  References:
//
//  ios - I want to make a video view inside a UIView with rounded rectangles - Stack Overflow
//  http://stackoverflow.com/questions/27675187/i-want-to-make-a-video-view-inside-a-uiview-with-rounded-rectangles
//
//  objective c - AVPlayer layer inside a view does not resize when UIView frame changes - Stack Overflow
//  http://stackoverflow.com/questions/10126200/avplayer-layer-inside-a-view-does-not-resize-when-uiview-frame-changes
//
//  ios - AVPlayerLayerの角を丸くするには？ - スタック・オーバーフロー
//  http://ja.stackoverflow.com/questions/2738/avplayerlayerの角を丸くするには

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
        // get filePath
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
            layer.masksToBounds = YES;
            
            // redraw when resize
            layer.needsDisplayOnBoundsChange = YES;
            // get video size
            CGSize videoSize = [[[_videoPlayer.currentItem.asset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0] naturalSize];

            // fit video width to view width
            CGRect bounds = self.bounds;
            bounds.size = CGSizeMake(self.bounds.size.width, self.bounds.size.width * (videoSize.height / videoSize.width));
            layer.bounds = bounds;
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
