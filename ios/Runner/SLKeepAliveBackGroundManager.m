////
////  SLKeepAliveBackGroundManager.m
////  SangoLive
////
////  Created by  on 2023/7/10.
////  Copyright © 2023 Sango. All rights reserved.
////
//
//#import "SLKeepAliveBackGroundManager.h"
//#import "UIKit/UIApplication.h"
//#import <AVFAudio/AVAudioSession.h>
//#import <AVFAudio/AVMIDIPlayer.h>
//
/////循环时间
//static NSInteger kCirculaDuration = 30;
//
//@interface SLKeepAliveBackGroundManager ()
//
///// 后台任务
//@property (nonatomic, assign) UIBackgroundTaskIdentifier bgTask;
///// 后台播放
//@property (nonatomic,strong) AVAudioPlayer *player;
///// 定时器
//@property (nonatomic, strong) NSTimer *timer;
//
//@property (nonatomic, strong) dispatch_queue_t queue;
//
//@end
//
//@implementation SLKeepAliveBackGroundManager {
//    CFRunLoopRef _runloopRef;
//}
//
//
//
//- (instancetype)init {
//    if (self = [super init]) {
//        [self setup];
//    }
//    return self;
//}
//
//- (void)setup {
//    self.queue = dispatch_queue_create("com.audio.background", NULL);
//    [self setupAudioSession];
//    [self setupPlayer];
//}
//
//- (void)setupPlayer {
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"live_empty_music" ofType:@"mp3"];
//    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
//    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
//    [self.player prepareToPlay];
//    self.player.volume = 0.0;
//    self.player.numberOfLoops = -1; // 循环播放
//}
//
//- (void)setupAudioSession {
//    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
//    [[AVAudioSession sharedInstance] setMode:AVAudioSessionModeDefault error:nil];
//    
//    NSString *route = [[[[[AVAudioSession sharedInstance] currentRoute] outputs] objectAtIndex:0] portType];
//    
//    if ([route isEqualToString:AVAudioSessionPortHeadphones] ||
//        [route isEqualToString:AVAudioSessionPortBluetoothA2DP] ||
//        [route isEqualToString:AVAudioSessionPortBluetoothLE] ||
//        [route isEqualToString:AVAudioSessionPortBluetoothHFP]) {
//        if (@available(iOS 10.0, *)) {
//            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
//                                             withOptions:(AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionAllowBluetooth | AVAudioSessionCategoryOptionAllowBluetoothA2DP | AVAudioSessionCategoryOptionDefaultToSpeaker)
//                                                   error:nil];
//        } else {
//            // Fallback on earlier versions
//        }
//    } else {
//        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
//                                         withOptions:(AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionDefaultToSpeaker)
//                                               error:nil];
//    }
//    NSError *error = nil;
//    [audioSession setActive:YES error:&error];
//    if (error) {
////        SLLog(@"Error activating AVAudioSession: %@", error);
//    }
//}
//
///// 启动后台运行
//- (void)startKeepAlive {
//    [self.player play];
//    [self applyforBackgroundTask];
//    dispatch_async(self.queue, ^{
//        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:kCirculaDuration target:self selector:@selector(startAudioPlay) userInfo:nil repeats:YES];
//        self->_runloopRef = CFRunLoopGetCurrent();
//        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
//        CFRunLoopRun();
//    });
//}
//
//- (void)stopKeepRunAlive {
//    if (self.timer) {
//        CFRunLoopStop(_runloopRef);
//        [self.timer invalidate];
//        self.timer = nil;
//        [self.player stop];
//    }
//    
//    if (self.bgTask) {
//        [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
//        self.bgTask = UIBackgroundTaskInvalid;
//    }
//}
//
/////  申请后台
//- (void)applyforBackgroundTask {
//    self.bgTask =[[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
//            self.bgTask = UIBackgroundTaskInvalid;
//        });
//    }];
//}
//
//- (void)startAudioPlay {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if ([[UIApplication sharedApplication] backgroundTimeRemaining] < 31.0) {
//            [self.player play];
//            [self applyforBackgroundTask];
//        } else {
//            
//        }
//        [self.player stop];
//    });
//}
//
//@end
