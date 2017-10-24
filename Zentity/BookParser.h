//
//  BookParser.h
//  Zentity
//
//  Created by Tomas Radvansky on 16/02/2017.
//  Copyright © 2017 Tomas Radvansky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class Book, AppDelegate;

@interface BookParser : NSObject <NSXMLParserDelegate>{
    
    Book *book;
    AppDelegate *appdelegate;
    
    NSMutableString *curElem;
    
}

@property (nonatomic, retain) Book *book;
@property (nonatomic, retain) AppDelegate *appdelegate;
@property (nonatomic, retain) NSMutableString *curElem;

- (BookParser*) initXMLParser;

@end
