//
//  AppDelegate.m
//  AllAboutSteveJobs
//
//  Created by Dice on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
//#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "RootViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    viewController1.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    navController1.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem1 = [[UITabBarItem alloc] initWithTitle:@"Bio" image:[UIImage imageNamed:@"administrator_star.png"] tag:0];
    viewController1.tabBarItem = theItem1;
    
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    viewController2.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    navController2.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem2 = [[UITabBarItem alloc] initWithTitle:@"Being Steve" image:[UIImage imageNamed:@"anonymous_30.png"] tag:0];
    viewController2.tabBarItem = theItem2;
    
    UIViewController *viewController3 = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    viewController3.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    navController3.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem3 = [[UITabBarItem alloc] initWithTitle:@"Pictures" image:[UIImage imageNamed:@"cartoon_30.png"] tag:0];
    viewController3.tabBarItem = theItem3;
    
    UIViewController *viewController4 = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
    viewController4.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    UINavigationController *navController4 = [[UINavigationController alloc] initWithRootViewController:viewController4];
    navController4.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem4 = [[UITabBarItem alloc] initWithTitle:@"Videos" image:[UIImage imageNamed:@"clapperboard_30.png"] tag:0];
    viewController4.tabBarItem = theItem4;
    
    UIViewController *viewController5 = [[FifthViewController alloc] initWithNibName:@"FifthViewController" bundle:nil];
    viewController5.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background_Black_Apple.jpg"]];
    UINavigationController *navController5 = [[UINavigationController alloc] initWithRootViewController:viewController5];
    navController5.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem5 = [[UITabBarItem alloc] initWithTitle:@"About" image:[UIImage imageNamed:@"info_30.png"] tag:0];
    viewController5.tabBarItem = theItem5;
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, navController2,navController3,navController4,navController5, nil];
    //[self.tabBarController.tabBar setItems:[NSArray arrayWithObjects:[UIImage imageNamed:@"administrator_star.png"],[UIImage imageNamed:@"administrator_star.png"],[UIImage imageNamed:@"administrator_star.png"],[UIImage imageNamed:@"administrator_star.png"],nil] animated:YES];
    
    
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
