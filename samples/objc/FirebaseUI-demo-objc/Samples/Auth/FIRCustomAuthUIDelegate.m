//
//  AuthViewController.m
//
//  Copyright (c) 2016 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "FIRCustomAuthUIDelegate.h"
#import "FIRCustomAuthPickerViewController.h"
#import "FIRCustomEmailEntryViewController.h"
#import "FIRCustomPasswordSignInViewController.h"
#import "FIRCustomPasswordSignUpViewController.h"
#import "FIRCustomPasswordRecoveryViewController.h"
#import "FIRCustomPasswordVerificationViewController.h"

@implementation FIRCustomAuthUIDelegate

- (void)authUI:(FIRAuthUI *)authUI didSignInWithUser:(nullable FIRUser *)user error:(nullable NSError *)error {
  if (error) {
    if (error.code == FIRAuthUIErrorCodeUserCancelledSignIn) {
      NSLog(@"User cancelled sign-in");
    } else {
      NSError *detailedError = error.userInfo[NSUnderlyingErrorKey];
      if (!detailedError) {
        detailedError = error;
      }
      NSLog(@"Login error: %@", detailedError.localizedDescription);
    }
  }
}

- (FIRAuthPickerViewController *)authPickerViewControllerForAuthUI:(FIRAuthUI *)authUI {
  return [[FIRCustomAuthPickerViewController alloc] initWithNibName:NSStringFromClass([FIRCustomAuthPickerViewController class])
                                                             bundle:nil
                                                             authUI:authUI];
}

- (FIREmailEntryViewController *)emailEntryViewControllerForAuthUI:(FIRAuthUI *)authUI {
  return [[FIRCustomEmailEntryViewController alloc] initWithNibName:NSStringFromClass([FIRCustomEmailEntryViewController class])
                                                             bundle:nil
                                                             authUI:authUI];

}

- (FIRPasswordSignInViewController *)passwordSignInViewControllerForAuthUI:(FIRAuthUI *)authUI email:(NSString *)email {
  return [[FIRCustomPasswordSignInViewController alloc] initWithNibName:NSStringFromClass([FIRCustomPasswordSignInViewController class])
                                                                 bundle:nil
                                                                 authUI:authUI
                                                                  email:email];

}

- (FIRPasswordSignUpViewController *)passwordSignUpViewControllerForAuthUI:(FIRAuthUI *)authUI email:(NSString *)email {
  return [[FIRCustomPasswordSignUpViewController alloc] initWithNibName:NSStringFromClass([FIRCustomPasswordSignUpViewController class])
                                                                 bundle:nil
                                                                 authUI:authUI
                                                                  email:email];

}

- (FIRPasswordRecoveryViewController *)passwordRecoveryViewControllerForAuthUI:(FIRAuthUI *)authUI email:(NSString *)email {
  return [[FIRCustomPasswordRecoveryViewController alloc] initWithNibName:NSStringFromClass([FIRCustomPasswordRecoveryViewController class])
                                                                   bundle:nil
                                                                   authUI:authUI
                                                                    email:email];
  
}

- (FIRPasswordVerificationViewController *)passwordVerificationViewControllerForAuthUI:(FIRAuthUI *)authUI
                                                                                 email:(NSString *)email
                                                                         newCredential:(FIRAuthCredential *)newCredential {
  return [[FIRCustomPasswordVerificationViewController alloc] initWithNibName:NSStringFromClass([FIRCustomPasswordVerificationViewController class])
                                                                       bundle:nil
                                                                       authUI:authUI
                                                                        email:email
                                                                newCredential:newCredential];
}

@end