//

//  DetailViewController.h
//  Photography
//
//  Created by Ishaan Gandhi on 9/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    
    IBOutlet UILabel *sectionHeader;
    IBOutlet UILabel *header;
    IBOutlet UITextView *bodyText;
    IBOutlet UIImageView *image;
    IBOutlet UILabel *caption;
    IBOutlet UIButton *smallerTextButton;
    IBOutlet UIButton *biggerTextButton;
    
}
-(void)setPageWithHeader:(NSString *)headerText sectionHeader:(NSString *)sectionHeaderText
                 caption:(NSString *)captionText image:(UIImage *)imageImage andBody:(NSString *)body;

- (IBAction)smallerText:(id)sender;

- (IBAction)biggerText:(id)sender;

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) id detailItem;
@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, retain) IBOutlet UILabel *sectionHeader;
@property (readwrite, retain) IBOutlet UILabel *header;
@property (nonatomic, retain) IBOutlet UITextView *bodyText;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UILabel *caption;
@property (nonatomic, retain) IBOutlet UIButton *smallerTextButton;
@property (nonatomic, retain) IBOutlet UIButton *biggerTextButton;

@end
