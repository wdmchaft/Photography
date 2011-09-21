//
//  Resources.m
//  Photography
//
//  Created by Ishaan Gandhi on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Resources.h"

@implementation Resources
@synthesize textArray, captionsArray, imageArray;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        [self initializeWithText];
        [self initializeWithCaptions];
        [self initializeWithImages];
    }
    
    return self;
}

-(void)initializeWithText {
    textArray = [[NSArray alloc] init];
    //Add the text to the array
    Sec1 = [[NSMutableArray alloc] init];
    [Sec1 addObject:@"Congratulations on downloading this app!  Whether you are a newbie, wanting to learn the basics, or a dad who’s disappointed with the vacation photos, this app is a great place to begin.  Overall, you will learn things at a fairly slow pace, so you can absorb concepts.  However, if at any time, you feel the need to reread some text, or look at a caption, please do, as some things might become harder later.  Also having a usable DSLR is important, so as to practice your recently learned material."];
    [Sec1 addObject:@"A: Lens: Converges light to form images\nB: Lens Cap: Used for protecting lens\nC: Focus ring:  Users use this to focus their images\nD: Shutter Button: Press this to capture an image\nE: Mode Dial: Discussed in length later"];
    [Sec1 addObject:@"At the top of your DSLR, you should see a round wheel, with letters like M, S, A, and P on them.  You probably also have something that says auto, a flower, mountains etc.  This is called the Mode Dial.  It us used to change what mode your camera will shoot in.  Lets talk about the M, S, A, and P modes. \n\nM: Manual.  Use this to control both shutter speed and aperture.\nS: Shutter priority.  Change the shutter speed, and the camera will adjust the aperture to have to have good light balance.\nA: Aperture priority.  Change the Aperture, and the camera will adjust shutter speed for best light balance.\nP: Program.  Get partial control over both shutter speed and aperture.\nNote: This will make much more sense later on, when you will learn about aperture, shutter speed, and light balance."];
    textArray = [NSArray arrayWithObjects:Sec1, Sec2, Sec3, nil];
    [Sec1 release];
    [Sec2 release];
    [Sec3 release];
}

-(void)initializeWithCaptions {
    Sec1Cap = [[NSMutableArray alloc] init];
    [Sec1Cap addObject:@"A Canon Rebel DSLR. Having a usable DSLR is important."];
    [Sec1Cap addObject:@"Refer to text"];
    [Sec1Cap addObject:@"The Mode Dial"];
    captionsArray = [[NSArray alloc] initWithObjects:Sec1Cap, Sec2Cap, Sec3Cap, nil];
    [Sec1Cap release];
}

-(void)initializeWithImages {
    Sec1Im = [[NSMutableArray alloc] init];
    [Sec1Im addObject:[UIImage imageNamed:@"DSLR.png"]];
    [Sec1Im addObject:[UIImage imageNamed:@"parts.png"]];
    [Sec1Im addObject:[UIImage imageNamed:@"modeDial.png"]];
    imageArray = [[NSArray alloc] initWithObjects:Sec1Im, Sec2Im, Sec3Im, nil];
    [Sec1Im release];
}

@end
