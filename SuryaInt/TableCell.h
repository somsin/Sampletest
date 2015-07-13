//
//  TableCell.h
//  SuryaS
//
//  Created by Somendra Singh on 12/07/15.
//  Copyright (c) 2015 somendra singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell
{
}
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@property (weak, nonatomic) IBOutlet UILabel *emailLbl;


@end
