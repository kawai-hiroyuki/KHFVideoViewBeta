KHFVideoViewBeta
================
Simple and Easy to use, VideoView for iOS.

![](gallery.gif)

##How to build

```
$ git clone https://github.com/kawai-hiroyuki/KHFVideoViewBeta
```

## How to use
```
KHFVideo *video = [KHFVideo videoNamed:@"sample.mp4"];
KHFVideoView *videoView = [[KHFVideoView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
[videoView setVideo:video];
[self.view addSubview:videoView];
```

##Related Article
* [ios - I want to make a video view inside a UIView with rounded rectangles - Stack Overflow](http://stackoverflow.com/questions/27675187/i-want-to-make-a-video-view-inside-a-uiview-with-rounded-rectangles)
* [ios - AVPlayerLayerの角を丸くするには？ - スタック・オーバーフロー](http://ja.stackoverflow.com/questions/2738/avplayerlayerの角を丸くするには) [Japanese]

# Special Thanks
Movie samples in this project are refer from [NHK Creative Library](http://www1.nhk.or.jp/creative/en/).