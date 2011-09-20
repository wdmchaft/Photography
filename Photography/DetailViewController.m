//
//  DetailViewController.m
//  Photography
//
//  Created by Ishaan Gandhi on 9/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

#import "RootViewController.h"

@interface DetailViewController ()


@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation DetailViewController
static UILabel *sectionHeaderGlobal;
static UILabel *headerGlobal;
static UITextView *bodyTextGlobal;
static UIImageView *imageGlobal;
static UILabel *captionGlobal;

@synthesize toolbar = _toolbar;
@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize popoverController = _myPopoverController;
@synthesize sectionHeader, header, bodyText, image, caption, biggerTextButton, smallerTextButton;

#pragma mark - Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }
    
    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }     
    
}

-(void)viewDidLoad {
    sectionHeaderGlobal = [[UILabel alloc] init];
    headerGlobal = [[UILabel alloc] init];
    bodyTextGlobal = [[UITextView alloc] init];
    imageGlobal = [[UIImageView alloc] init];
    captionGlobal = [[UILabel alloc] init];
    
    sectionHeaderGlobal = sectionHeader;
    headerGlobal = header;
    bodyTextGlobal = bodyText;
    imageGlobal = image;
    captionGlobal = caption;
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    self.detailDescriptionLabel.text = [self.detailItem description];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        smallerTextButton.center = CGPointMake(600, 700);
        biggerTextButton.center = CGPointMake(630, 697);
        
    }
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
        smallerTextButton.center = CGPointMake(684, 950);
        biggerTextButton.center = CGPointMake(711, 947);
    }
    return YES;
}

-(void)setPageWithHeader:(NSString *)headerText sectionHeader:(NSString *)sectionHeaderText
                 caption:(NSString *)captionText andBody:(NSString *)body {
    
    //Set the page for what RootView sent
    headerGlobal.text = headerText;
    sectionHeaderGlobal.text = sectionHeaderText;
    captionGlobal.text = captionText;
    bodyTextGlobal.text = body;
    
}

- (IBAction)smallerText:(id)sender {
    if(self.bodyText.font.pointSize > 20){
        UIFont *newFont = [UIFont fontWithName:@"Georgia" size:self.bodyText.font.pointSize - 1];
        bodyText.font = newFont;
    }
}
    
- (IBAction)biggerText:(id)sender {
    if(self.bodyText.font.pointSize < 50){
        UIFont *newFont = [UIFont fontWithName:@"Georgia" size:self.bodyText.font.pointSize + 1];
        bodyText.font = newFont;  
    }
}

#pragma mark - Split view support

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    barButtonItem.title = @"Table of Contents";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}



- (void)viewDidUnload
{
    
    [sectionHeader release];
    self.sectionHeader = nil;
    [header release];
    self.header = nil;
    [bodyText release];
    self.bodyText = nil;
    [image release];
    self.image = nil;
    [caption release];
    self.caption = nil;
    [smallerTextButton release];
    self.smallerTextButton = nil;
    [biggerTextButton release];
    self.biggerTextButton = nil;
	[super viewDidUnload];
    
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_myPopoverController release];
    [_toolbar release];
    [_detailItem release];
    [_detailDescriptionLabel release];
    [sectionHeader release];
    [header release];
    [bodyText release];
    [image release];
    [caption release];
    [smallerTextButton release];
    [biggerTextButton release];
    [super dealloc];
}


@end
