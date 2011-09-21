//
//  MainText.h
//  Photography
//
//  Created by Ishaan Gandhi on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resources : NSObject {
    NSArray *textArray;
    NSArray *captionsArray;
    NSArray *imageArray;
    NSMutableArray *Sec1;
    NSMutableArray *Sec2;
    NSMutableArray *Sec3;
    NSMutableArray *Sec1Cap;
    NSMutableArray *Sec2Cap;
    NSMutableArray *Sec3Cap;
    NSMutableArray *Sec1Im;
    NSMutableArray *Sec2Im;
    NSMutableArray *Sec3Im;
    
}

@property (nonatomic, retain) NSArray *textArray;
@property (nonatomic, retain) NSArray *captionsArray;
@property (nonatomic, retain) NSArray *imageArray;

-(void)initializeWithText;
-(void)initializeWithCaptions;
-(void)initializeWithImages;


@end
