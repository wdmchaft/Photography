//
//  RootViewController.m
//  Photography
//
//  Created by Ishaan Gandhi on 9/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "DetailViewController.h"

@implementation RootViewController
		
@synthesize detailViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];    
    Sec1 = [[NSArray alloc] initWithObjects:@"Introduction", @"Parts of a DSLR 1", @"Mode Dial", @"Holding a DSLR", @"Anatomy", nil];
    Sec2 = [[NSArray alloc] initWithObjects:@"iPhone", @"iPod", @"iPad 2", nil];
    Sec3 = [[NSArray alloc] initWithObjects:@"iPhone", @"iPod", @"iPad 3", nil];
    sectionArray = [[NSArray alloc] initWithObjects:Sec1, Sec2, Sec3, nil];
    sectionTitles = [[NSArray alloc] initWithObjects:@"Fundamentals", @"Concepts", @"Conclusion", nil];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 500.0);
}

-(Resources*) resource {
   // if (!resource) {
        resource = [[Resources alloc] init];
   // }
    return resource;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    		
}

		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //declare how many rows should be in each section
    NSInteger rows;
    rows = [[sectionArray objectAtIndex:section] count];  
    return rows;    		
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //Set the section titles
	return [sectionTitles objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[sectionArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];

    // Configure the cell.
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [[DetailViewController alloc] init];
    
    NSString *header = [[NSString alloc] init];
    header = [[sectionArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    
    NSString *body = [[NSString alloc] init];
    body = [[[[self resource] textArray] objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    
    NSString *caption = [[NSString alloc] init];
    caption = [[[[self resource] captionsArray] objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    
    UIImage *image = [[UIImage alloc] init];
    image = [[[[self resource] imageArray] objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    
    [dvc setPageWithHeader:header sectionHeader:[sectionTitles objectAtIndex:indexPath.section] caption:caption image:image andBody:body];
    
    [resource release];
    [dvc release];
    [body release];
    [image release];
    [header release];
    [caption release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [detailViewController release];
    [Sec1 release];
    [Sec2 release];
    [Sec3 release];
    [sectionArray release];
    [sectionTitles release];
    [super dealloc];
}

@end
