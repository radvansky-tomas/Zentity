//
//  BookParser.m
//  Zentity
//
//  Created by Tomas Radvansky on 16/02/2017.
//  Copyright © 2017 Tomas Radvansky. All rights reserved.
//

#import "BookParser.h"
#import "Book.h"

@interface BookParser ()

@end

@implementation BookParser

@synthesize curElem,book,appdelegate;

- (BookParser *) initXMLParser
{
    self = [super init];
    
    appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    return self;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"ZREADER"]) {
        //Initialize the array.
        appdelegate.books = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"BOOK"]) {
        
        //Initialize the book.
        book = [[Book alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    
    if(!curElem)
        curElem = [[NSMutableString alloc] initWithString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    else
       [curElem appendString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"ZREADER"])
        return;
    
    if([elementName isEqualToString:@"BOOK"]) {
        [appdelegate.books addObject:book];
        book = nil;
    }
    else if([elementName isEqualToString:@"ID"]) {
        //Parsing
         [book setValue: [NSNumber numberWithLong:curElem.longLongValue] forKey:elementName];
    }
    else if([elementName isEqualToString:@"NEW"]) {
        //Parsing
       [book setValue: [NSNumber numberWithBool:curElem.boolValue] forKey:elementName];
    }
    else
    {
    [book setValue: curElem forKey:elementName];

    }
    
    curElem = nil;
}
@end

