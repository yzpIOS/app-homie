//
//  HookMutableArray.m
//  Runner
//
//  Created by sundar on 2023/7/14.
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "HookMutableArray.h"

@implementation HookMutableArray
@synthesize origSel;
@synthesize oriMethod;

-(void) startHook
{
    NSMutableArray *mutArray = [NSMutableArray array];

    Class class = [mutArray class];
    

    SEL originalSelector = @selector(insertObject:atIndex::);
    SEL swizzledSelector = @selector(insertObject2:atIndex:);
    
    
    
//    Class class = [NSArray class];
//
//    SEL originalSelector = @selector(loopLogWithCount:);
//    SEL swizzledSelector = @selector(hook_loopLogWithCount:);
    

    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);


    BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

    
}


- (void)loopLogWithCount:(NSInteger)count {
    NSLog(@"hook after count: %d", count);
}


- (void)hook_loopLogWithCount:(NSInteger)count {
    NSLog(@"hook after count: %d", count);
}

- (void)insertObject2:(NSObject*)anObject atIndex:(NSUInteger)index;
{
    NSLog(@"hook after count: %d", index);
}


@end


@implementation NSMutableArray (akSafe)
+ (void)load {
    [self swizzMethodOriginalSelector:@selector(addObject:)
                     swizzledSelector:@selector(akSafe_addObject:)];
}
+ (void)swizzMethodOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    Method originalMethod = class_getInstanceMethod(self.class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self.class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(self.class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(self.class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
- (void)aksafe_AddObject:(id)anObject {
    if (anObject) {
        [self aksafe_AddObject:anObject];
    }
}
@end
