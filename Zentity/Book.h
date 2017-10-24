//
//  Book.h
//  Zentity
//
//  Created by Tomas Radvansky on 16/02/2017.
//  Copyright © 2017 Tomas Radvansky. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Book : NSObject {
    NSNumber *ID;
    NSString *TITLE;
    NSString *THUMBNAIL;
    NSString *THUMB_EXT;
    NSString *PDF_EXT;
    NSNumber *NEW;
}

@property (nonatomic, retain) NSNumber *ID;
@property (nonatomic, retain) NSString *TITLE;
@property (nonatomic, retain) NSString *THUMBNAIL;
@property (nonatomic, retain) NSString *THUMB_EXT;
@property (nonatomic, retain) NSString *PDF_EXT;
@property (nonatomic, retain) NSNumber *NEW;

@end
