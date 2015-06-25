//
//  FISAddLocationViewController.m
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISAddLocationViewController.h"

@interface FISAddLocationViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;

@end

@implementation FISAddLocationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.nameField.delegate = self;
    [self.nameField becomeFirstResponder];
    self.saveBarButton.enabled = NO;
}

-(IBAction)cancelButtonTapped:(id)sender
{
    [self.delegate addLocationViewControllerDidCancel:self];
}

-(IBAction)saveButtonTapped:(id)sender
{
    [self.delegate addLocationViewController:self
                    didAddLocationNamed:self.nameField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.delegate addLocationViewController:self
                        shouldAllowLocationNamed:self.nameField.text]) {
        self.saveBarButton.enabled = YES;
        [self.nameField resignFirstResponder];
        return YES;
    }
    self.saveBarButton.enabled = NO;
    return NO;
}

- (IBAction)textFieldEditing:(id)sender
{
    if ([self.delegate addLocationViewController:self
                        shouldAllowLocationNamed:self.nameField.text]) {
        self.saveBarButton.enabled = YES;
    }
    self.saveBarButton.enabled = NO;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
