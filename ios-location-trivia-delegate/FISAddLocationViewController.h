//
//  FISAddLocationViewController.h
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol MyProtocolName;
//
//@interface MyViewController: UIViewController
//
//@property (nonatomic, weak) id<MyProtocolName> delegate;
//
//@end
//
//@protocol MyProtocolName <NSObject>
//@required
//-(void)requiredDelegateMethod;
//
//@optional
//-(void)optionalDelegateMethodOne;
//-(void)optionalDelegateMethodTwo:(NSString *)withArgument;
//
//@end // end of delegate protocol




@protocol FISAddLocationViewControllerDelegate;

@interface FISAddLocationViewController: UIViewController

@property (nonatomic, weak) id <FISAddLocationViewControllerDelegate> delegate;

@end

@protocol FISAddLocationViewControllerDelegate <NSObject>
@required

- (void)addLocationViewControllerDidCancel:(FISAddLocationViewController *)viewController;
- (BOOL)addLocationViewController:(FISAddLocationViewController *)viewController
         shouldAllowLocationNamed:(NSString *)locationName;
- (void)addLocationViewController:(FISAddLocationViewController *)viewController
              didAddLocationNamed:(NSString *)locationName;

@end
