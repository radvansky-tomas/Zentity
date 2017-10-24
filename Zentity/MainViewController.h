//
//  ViewController.h
//  Zentity
//
//  Created by Tomas Radvansky on 16/02/2017.
//  Copyright © 2017 Tomas Radvansky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

