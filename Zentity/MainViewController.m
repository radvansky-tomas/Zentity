//
//  ViewController.m
//  Zentity
//
//  Created by Tomas Radvansky on 16/02/2017.
//  Copyright © 2017 Tomas Radvansky. All rights reserved.
//

#import "MainViewController.h"
#import "RowTableViewCell.h"
#import "Book.h"
#import "AppDelegate.h"
#import "BookParser.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Use custom XIB
    [[self mainTableView] registerNib:[UINib nibWithNibName:@"RowTableViewCell" bundle:nil] forCellReuseIdentifier:@"RowCell"];
    
    //Start data loading task
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.lukaspetrik.cz/filemanager/tmp/reader/data.xml"];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            //Parse data
            NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:data];
            
            BookParser *parser = [[BookParser alloc] initXMLParser];
            
            [xmlparser setDelegate:parser];
            
            BOOL success = [xmlparser parse];
            
            if(success){
                NSLog(@"Parsing Successful");
                [[self mainTableView] reloadData];
            }
            else
            {
                NSLog(@"Parsing Error!");
            }
            return;
        }
        NSLog(@"Data loading error");
        if (error != NULL)
        {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [task resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RowCell";
    
    RowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[RowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //Check for first column
    if (appdelegate.books.count > (indexPath.row * 3) + 0)
    {
        Book* bookColumn0 = [appdelegate.books objectAtIndex:(indexPath.row * 3) + 0];
        cell.book0.hidden = false;
        [cell.book0Title setText:bookColumn0.TITLE];
        
        if ([bookColumn0.NEW boolValue] == true)
        {
            cell.book0New.hidden = false;
        }
        else
        {
            cell.book0New.hidden = true;
        }
        
        cell.book0Cover.image = nil;
        
        NSURL *url = [NSURL URLWithString:bookColumn0.THUMBNAIL];
        
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        RowTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                        if (updateCell)
                        {
                            updateCell.book0Indicator.hidden = true;
                            updateCell.book0NoImage.hidden = true;
                            updateCell.book0Cover.image = image;
                        }
                    });
                    return;
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                RowTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                if (updateCell)
                {
                    updateCell.book0Indicator.hidden = true;
                    updateCell.book0NoImage.hidden = false;
                }
            });
            
        }];
        [task resume];
        cell.book0Indicator.hidden = false;
    }
    else
    {
        cell.book0.hidden = true;
        cell.book0New.hidden = true;
    }
    
    if (appdelegate.books.count > (indexPath.row * 3) + 1)
    {
        Book* bookColumn1 = [appdelegate.books objectAtIndex:(indexPath.row * 3) + 1];
        cell.book1.hidden = false;
        [cell.book1Title setText:bookColumn1.TITLE];
        
        if ([bookColumn1.NEW boolValue] == true)
        {
            cell.book1New.hidden = false;
        }
        else
        {
            cell.book1New.hidden = true;
        }
        
        cell.book1Cover.image = nil;
        
        NSURL *url = [NSURL URLWithString:bookColumn1.THUMBNAIL];
        
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            cell.book1Indicator.hidden = true;
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        RowTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                        if (updateCell)
                        {
                            updateCell.book1Cover.image = image;
                            updateCell.book1NoImage.hidden = true;
                            updateCell.book1Cover.image = image;
                        }
                    });
                    return;
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                RowTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                if (updateCell)
                {
                    updateCell.book1Indicator.hidden = true;
                    updateCell.book1NoImage.hidden = false;
                }
            });
        }];
        [task resume];
        cell.book1Indicator.hidden = false;
    }
    else
    {
        cell.book1.hidden = true;
        cell.book1New.hidden = true;
    }
    
    if (appdelegate.books.count > (indexPath.row * 3) + 2)
    {
        Book* bookColumn2 = [appdelegate.books objectAtIndex:(indexPath.row * 3) + 2];
        cell.book2.hidden = false;
        [cell.book2Title setText:bookColumn2.TITLE];
        
        if ([bookColumn2.NEW boolValue] == true)
        {
            cell.book2New.hidden = false;
        }
        else
        {
            cell.book2New.hidden = true;
        }
        
        cell.book2Cover.image = nil;
        
        NSURL *url = [NSURL URLWithString:bookColumn2.THUMBNAIL];
        
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            cell.book2Indicator.hidden = true;
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        RowTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                        if (updateCell)
                        {
                            updateCell.book2Cover.image = image;
                            updateCell.book2NoImage.hidden = true;
                            updateCell.book2Cover.image = image;
                        }
                    });
                    return;
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                RowTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                if (updateCell)
                {
                    updateCell.book2Indicator.hidden = true;
                    updateCell.book2NoImage.hidden = false;
                }
            });
        }];
        [task resume];
        cell.book2Indicator.hidden = false;
    }
    else
    {
        cell.book2.hidden = true;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSUInteger booksCount = appdelegate.books.count;
    int numberOfNeededRows = ceil(booksCount / 3.0);
    if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)||([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)){
        //Empty rows
        if (numberOfNeededRows < 3)
        {
            return 3;
        }
        else
        {
            return numberOfNeededRows;
        }
    }
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait){
        //Empty rows
        if (numberOfNeededRows<5)
        {
            return 5;
        }
        else
        {
            return numberOfNeededRows;
        }
    }
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Proper sizing
    CGFloat numberOfRows = 1;
    if (([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeLeft)||([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeRight)){
        //do something or rather
        numberOfRows = 3;
    }
    if ([[UIDevice currentDevice]orientation] == UIInterfaceOrientationPortrait){
        //do something or rather
        numberOfRows = 5;
    }
    
    return tableView.frame.size.height / numberOfRows;
}

//Orientation handling
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.mainTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
