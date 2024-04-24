//
//  SLKeepAliveBackGroundManager.h
//  SangoLive
//
//  Created by 杨瑞琪 on 2023/7/10.
//  Copyright © 2023 Sango. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 用于屏幕录制时，退到后台保活
@interface SLKeepAliveBackGroundManager : NSObject<MiKiCoreProtocol>

- (void)startKeepAlive;

- (void)stopKeepRunAlive;

@end

NS_ASSUME_NONNULL_END
