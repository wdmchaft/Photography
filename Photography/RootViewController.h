//
//  RootViewController.h
//  Photography
//
//  Created by Ishaan Gandhi on 9/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController {
    NSArray *sectionArray;
    NSArray *Sec1;
    NSArray *Sec2;
    NSArray *Sec3;
    NSArray *sectionTitles;
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;



@end
