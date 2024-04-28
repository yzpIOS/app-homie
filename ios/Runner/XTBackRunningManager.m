//
//  XTBackRunningManager.m
//  XTBackRunningDemo
//
//  Created by mshi on 2022/1/20.
//

#import "XTBackRunningManager.h"
#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
@interface XTBackRunningManager ()
@property (nonatomic,assign) UIBackgroundTaskIdentifier backgroundTaskIdentifier;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@end

@implementation XTBackRunningManager
+ (instancetype)shareManager {
    static XTBackRunningManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[XTBackRunningManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addNoti];
    }
    return self;
}

- (void)addNoti {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void)appWillEnterForeground {
    NSLog(@"%@ appWillEnterForeground",NSStringFromClass([self class]));
    [self stopBackRuning];
}

- (void)appDidEnterBackground {
    NSLog(@"%@ appDidEnterBackground",NSStringFromClass([self class]));
    [self startBackRuning];
}

- (void)startBackRuning {
    NSLog(@"%@ startBackRuning",NSStringFromClass([self class]));
    self.backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
        self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
        [self startDoTask];
    }];

}
- (void)stopBackRuning {
    NSLog(@"%@ stopBackRuning",NSStringFromClass([self class]));
    if (self.backgroundTaskIdentifier) {
        [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
        self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    }
    
    [self stopDoTask];
}

- (void)startDoTask {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startDoTask) object:nil];
    
    [self doTask];
    
    [self performSelector:@selector(startDoTask) withObject:nil afterDelay:10];

}

- (void)doTask {
    [self playTask];
}

- (void)stopDoTask {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startDoTask) object:nil];
}

#pragma mark - Pravite

- (void)playTask {
    [self setAudioPlaySession];
    [self playSound];
    NSLog(@"%@ playTask",NSStringFromClass([self class]));
}

- (void)setAudioPlaySession {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if([NSThread mainThread]){
        [audioSession setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
        [audioSession setActive:YES error:nil];
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [audioSession setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
            [audioSession setActive:YES error:nil];
        });
    }
}

- (void)playSound
{
    if (!self.audioPlayer) {
        // 播放文件
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"live_empty_music" ofType:@"mp3"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
        if (!fileURL) {
            NSLog(@"playEmptyAudio 找不到播放文件");
        }
        
        // 0.0~1.0,默认为1.0
        NSError *error = nil;
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
        self.audioPlayer.volume = 0.0;
        // 循环播放 保活在后台导航时 容易不生效
//        self.audioPlayer.numberOfLoops = -1;
//        [self.audioPlayer prepareToPlay];
    }
    [self.audioPlayer play];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.audioPlayer pause];
        self.audioPlayer = nil;
    });
}
@end
