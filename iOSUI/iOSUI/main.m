//
//  main.m
//  iOSUI
//
//  Created by chengz on 2021/12/30.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// 添加一个监听者
void addObserver() {
     
     // 1. 创建监听者
     /**
      *  创建监听者
      *
      *  @param allocator#>  分配存储空间
      *  @param activities#> 要监听的状态
      *  @param repeats#>    是否持续监听
      *  @param order#>      优先级, 默认为0
      *  @param observer     观察者
      *  @param activity     监听回调的当前状态
      */
     CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
         
         /*
          kCFRunLoopEntry = (1UL << 0),          进入工作
          kCFRunLoopBeforeTimers = (1UL << 1),   即将处理Timers事件
          kCFRunLoopBeforeSources = (1UL << 2),  即将处理Source事件
          kCFRunLoopBeforeWaiting = (1UL << 5),  即将休眠
          kCFRunLoopAfterWaiting = (1UL << 6),   被唤醒
          kCFRunLoopExit = (1UL << 7),           退出RunLoop
          kCFRunLoopAllActivities = 0x0FFFFFFFU  监听所有事件
          */
         switch (activity) {
             case kCFRunLoopEntry:
                 NSLog(@"进入");
                 break;
             case kCFRunLoopBeforeTimers:
                 NSLog(@"即将处理Timer事件");
                 break;
             case kCFRunLoopBeforeSources:
                 NSLog(@"即将处理Source事件");
                 break;
             case kCFRunLoopBeforeWaiting:
                 NSLog(@"即将休眠");
                 break;
             case kCFRunLoopAfterWaiting:
                 NSLog(@"被唤醒");
                 break;
             case kCFRunLoopExit:
                 NSLog(@"退出RunLoop");
                 break;
             default:
                 break;
         }
     });
     
     // 2. 添加监听者
     /**
      *  给指定的RunLoop添加监听者
      *
      *  @param rl#>       要添加监听者的RunLoop
      *  @param observer#> 监听者对象
      *  @param mode#>     RunLoop的运行模式, 填写默认模式即可
      */
     CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
 }

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        addObserver();
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
