//
//  ViewController.h
//  SuryaInt
//
//  Created by Somendra Singh on 13/07/15.
//  Copyright (c) 2015 somendra singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIActivityItemSource>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
- (IBAction)loginAction:(id)sender;

@end

