//
//  ViewController.m
//  SuryaInt
//
//  Created by Somendra Singh on 13/07/15.
//  Copyright (c) 2015 somendra singh. All rights reserved.
//

#import "ViewController.h"
#import "BaseRequest.h"
#import "ItemVC.h"
#import "ServicePleaseValidation.h"

@interface ViewController ()
{
    
    NSDictionary *returninfo;
    NSMutableArray *AllItem;
    UIActivityIndicatorView *activityView ;
}
@end

@implementation ViewController
@synthesize emailTextField;
- (void)viewDidLoad {
    
    
    emailTextField.keyboardAppearance=UIKeyboardAppearanceAlert;
    emailTextField.delegate=self;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



//keyboard exit on touch any where

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


-(void)call_LoginWebService
{
    
    returninfo=[[NSDictionary alloc]init];
    
    
    
    NSMutableDictionary* inputs = [[NSMutableDictionary alloc] init];
    
    [inputs setObject:emailTextField.text forKey:@"emailId"];
    
    BaseRequest *basecall=[[BaseRequest alloc]init];
    
    [basecall getJsonData:nil actionmethod:@"list?" parameters:inputs onComplete:^(NSDictionary *json) {
        
        NSLog(@"alll data here  ==%@",json);
        
        
        AllItem=[[NSMutableArray alloc]init];
        AllItem=[json objectForKey:@"items"];
        
        
        
        
        [activityView stopAnimating];
       // NSLog(@"my dat %@",AllItem);
        
       
        
        
        ItemVC *itemvcObj=[self.storyboard instantiateViewControllerWithIdentifier:@"detailsvc"];
        
        itemvcObj.gotItems=AllItem;
        
        
        
        [self.navigationController pushViewController:itemvcObj animated:YES];
        
        returninfo = json;
        
    } onError:^(NSError *error) {
        
        // handle error here
    }];
    
    
    
}


- (IBAction)loginAction:(id)sender
{
    
    
    
    if ((emailTextField.text.length==0)|| ![ServicePleaseValidation validateEmail:self->emailTextField.text])
    {
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Warning !!!" message:@"Please enter valid email"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    else {
        
      activityView = [[UIActivityIndicatorView alloc]
                                                 initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        activityView.center=self.view.center;
        [activityView startAnimating];
        [self.view addSubview:activityView];
        
        
        
        [self call_LoginWebService];
        
        
        
        
    }
    
    
}

@end
