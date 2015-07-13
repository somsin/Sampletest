//
//  ItemVC.m
//  SuryaS
//
//  Created by Somendra Singh on 13/07/15.
//  Copyright (c) 2015 somendra singh. All rights reserved.
//

#import "ItemVC.h"
#import "TableCell.h"
@interface ItemVC ()

@end

@implementation ItemVC
@synthesize gotItems;
- (void)viewDidLoad {
    
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [gotItems count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:@"DetailsCell"];
    
    
    NSDictionary *temp=[gotItems objectAtIndex:indexPath.row];
    
    cell.nameLbl.text=[temp objectForKey:@"firstName"];
    cell.emailLbl.text=[temp objectForKey:@"emailId"];
    UIImage *imageforprofile=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[temp objectForKey:@"imageUrl"]]]];
    
    
                                                     cell.profilePic.image=imageforprofile;
 
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
