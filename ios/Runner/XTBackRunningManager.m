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
@interface XTBackRunningManager ()<CLLocationManagerDelegate>
@property (nonatomic,assign) UIBackgroundTaskIdentifier backgroundTaskIdentifier;
@property (nonatomic, strong) CLLocationManager *locationManager;
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
        // 获取定位权限
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
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
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) {
        // 用户允许持续定位，使用定位保活
        [self locationTask];
    }else {
        [self playTask];
    }
    
}

- (void)stopDoTask {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startDoTask) object:nil];
}

#pragma mark - Pravite -

- (void)locationTask {
    [self.locationManager requestLocation];
    NSLog(@"%@ locationTask",NSStringFromClass([self class]));
}

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
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"RunInBackground" ofType:@"mp3"];
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

#pragma mark - property -
- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        [_locationManager setAllowsBackgroundLocationUpdates:YES];
        [_locationManager requestAlwaysAuthorization];
        [_locationManager requestWhenInUseAuthorization];
    }
    return _locationManager;
}


- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
}

- (void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"playEmptyAudio 找不到播放文件");
    if(status == kCLAuthorizationStatusAuthorized || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self addNoti];
    }
}
@end
