//
//  AppDelegate.m
//  AVFoundationDemo
//
//  Created by aixuexi on 2021/12/8.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


@end
