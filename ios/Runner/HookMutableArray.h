//
//  HookMutableArray.h
//  Runner
//
//  Created by sundar on 2023/7/14.
//

#ifndef HookMutableArray_h
#define HookMutableArray_h

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


#import "HookMutableArray.h"

@interface HookMutableArray : NSObject{
@public SEL origSel;
@public Method originMethod;
    @public 
}

// 原始方法
@property(readonly) SEL origSel;

// 原始方法
@property(readonly) Method oriMethod;

//
// hook 方法
//
-(void) startHook;


- (void)insertObject2:(NSObject*)anObject atIndex:(NSUInteger)index;

- (void)loopLogWithCount:(NSInteger)count;


- (void)hook_loopLogWithCount:(NSInteger)count;
@end

#endif /* HookMutableArray_h */
