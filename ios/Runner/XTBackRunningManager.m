//
//  XTBackRunningManager.m
//  Runner
//
//  Created by sundar on 2024/4/23.
//

#import <Foundation/Foundation.h>

#import "XTBackRunningManager.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>



///循环时间
static NSInteger kCirculaDuration = 10;

@interface XTBackRunningManager ()<CLLocationManagerDelegate>
/// 后台任务
@property (nonatomic, assign) UIBackgroundTaskIdentifier bgTask;
/// 后台播放
@property (nonatomic,strong) AVAudioPlayer *player;
/// 定时器
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) dispatch_queue_t queue;

@end



@implementation XTBackRunningManager {
    CFRunLoopRef _runloopRef;
}


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
        [self setup];
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
    [self stopKeepRunAlive];
}

- (void)appDidEnterBackground {
    NSLog(@"%@ appDidEnterBackground",NSStringFromClass([self class]));
    [self startKeepAlive];
}



- (void)setup {
    self.queue = dispatch_queue_create("com.audio.background", NULL);
    [self setupAudioSession];
    [self setupPlayer];
}

- (void)setupPlayer {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"live_empty_music" ofType:@"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    [self.player prepareToPlay];
    self.player.volume = 0.4;
    self.player.numberOfLoops = -1; // 循环播放
}

- (void)setupAudioSession {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [[AVAudioSession sharedInstance] setMode:AVAudioSessionModeDefault error:nil];
    
    NSString *route = [[[[[AVAudioSession sharedInstance] currentRoute] outputs] objectAtIndex:0] portType];
    
    if ([route isEqualToString:AVAudioSessionPortHeadphones] ||
        [route isEqualToString:AVAudioSessionPortBluetoothA2DP] ||
        [route isEqualToString:AVAudioSessionPortBluetoothLE] ||
        [route isEqualToString:AVAudioSessionPortBluetoothHFP]) {
        if (@available(iOS 10.0, *)) {
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
                                             withOptions:(AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionAllowBluetooth | AVAudioSessionCategoryOptionAllowBluetoothA2DP | AVAudioSessionCategoryOptionDefaultToSpeaker)
                                                   error:nil];
        } else {
            // Fallback on earlier versions
        }
    } else {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
                                         withOptions:(AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionDefaultToSpeaker)
                                               error:nil];
    }
    NSError *error = nil;
    [audioSession setActive:YES error:&error];
    if (error) {
        NSLog(@"Error activating AVAudioSession: %@", error);
    }
}

/// 启动后台运行
- (void)startKeepAlive {
    [self.player play];
    [self applyforBackgroundTask];
    dispatch_async(self.queue, ^{
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:kCirculaDuration target:self selector:@selector(startAudioPlay) userInfo:nil repeats:YES];
        self->_runloopRef = CFRunLoopGetCurrent();
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        CFRunLoopRun();
    });
}

- (void)stopKeepRunAlive {
    if (self.timer) {
        CFRunLoopStop(_runloopRef);
        [self.timer invalidate];
        self.timer = nil;
        [self.player stop];
    }
    
    if (self.bgTask) {
        [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
        self.bgTask = UIBackgroundTaskInvalid;
    }
}

///  申请后台
- (void)applyforBackgroundTask {
    self.bgTask =[[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
            self.bgTask = UIBackgroundTaskInvalid;
        });
    }];
}

- (void)startAudioPlay {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([[UIApplication sharedApplication] backgroundTimeRemaining] < 31.0) {
            [self.player play];
            [self applyforBackgroundTask];
        } else {
            [self.player stop];
        }
    });
}


@end
