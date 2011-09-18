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
    Sec1 = [[NSArray alloc] initWithObjects:@"iPhone", @"iPod", @"iPad", @"Random Value", nil];
    Sec2 = [[NSArray alloc] initWithObjects:@"iPhone", @"iPod", @"iPad 2", nil];
    Sec3 = [[NSArray alloc] initWithObjects:@"iPhone", @"iPod", @"iPad 3", nil];
    sectionTitles = [[NSArray alloc] initWithObjects:@"Intro", @"Concepts", @"Conclusion", nil];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 500.0);
}

-(DetailViewController *)dvc {
    DetailViewController *dvc;
    if(!dvc) 
        dvc = [[DetailViewController alloc] init];
    return dvc;
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
    //Switch between sections to declare how many rows should be in each section
    NSInteger rows;
    switch (section) {
        case 0:
            rows = [Sec1 count];
            break;
        case 1:
            rows = [Sec2 count];
            break;
        case 2:
            rows = [Sec3 count];
            break;
        default:
            break;
    }
    
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
    
    //Check which section the row is in
    if([indexPath section] == 0) 
        cell.textLabel.text = [Sec1 objectAtIndex:[indexPath row]];
    if([indexPath section] == 1) 
        cell.textLabel.text = [Sec2 objectAtIndex:[indexPath row]];
    if([indexPath section] == 2) 
        cell.textLabel.text = [Sec3 objectAtIndex:[indexPath row]];
    
    // Configure the cell.
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [[DetailViewController alloc] init];
    [dvc setPageWithHeader:@"asdf" sectionHeader:@"asdf" caption:@"asdf" andBody:@"asdf"];
    
    
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
    [super dealloc];
}

@end
