//
//  RowTableViewCell.h
//  Zentity
//
//  Created by Tomas Radvansky on 16/02/2017.
//  Copyright © 2017 Tomas Radvansky. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Book.h"

@interface RowTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *book0;
@property (weak, nonatomic) IBOutlet UIImageView *book0Cover;
@property (weak, nonatomic) IBOutlet UIImageView *book0New;
@property (weak, nonatomic) IBOutlet UILabel *book0Title;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *book0Indicator;
@property (weak, nonatomic) IBOutlet UILabel *book0NoImage;

@property (weak, nonatomic) IBOutlet UIView *book1;
@property (weak, nonatomic) IBOutlet UIImageView *book1Cover;
@property (weak, nonatomic) IBOutlet UIImageView *book1New;
@property (weak, nonatomic) IBOutlet UILabel *book1Title;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *book1Indicator;
@property (weak, nonatomic) IBOutlet UILabel *book1NoImage;

@property (weak, nonatomic) IBOutlet UIView *book2;
@property (weak, nonatomic) IBOutlet UIImageView *book2Cover;
@property (weak, nonatomic) IBOutlet UIImageView *book2New;
@property (weak, nonatomic) IBOutlet UILabel *book2Title;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *book2Indicator;
@property (weak, nonatomic) IBOutlet UILabel *book2NoImage;

@end

