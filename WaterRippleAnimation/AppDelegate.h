//
//  AppDelegate.h
//  WaterRippleAnimation
//
//  Created by 刘俊俊 on 17/1/16.
//  Copyright © 2017年 刘俊俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

