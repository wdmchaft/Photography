//
//  RootViewController.h
//  Photography
//
//  Created by Ishaan Gandhi on 9/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resources.h"

@class DetailViewController;

@interface RootViewController : UITableViewController {
    NSArray *sectionArray;
    NSArray *Sec1;
    NSArray *Sec2;
    NSArray *Sec3;
    NSArray *sectionTitles;
    Resources *resource;
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

-(Resources *)resource;

@end
