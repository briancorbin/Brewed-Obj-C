//
//  StylesViewController.m
//  Brewed
//
//  Created by Brian Corbin on 8/4/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import "StylesViewController.h"

@interface StylesViewController ()

@end

@implementation StylesViewController

@synthesize styles, stylesTableView;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* tempStyles = [[NSArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] arrayForKey:@"styles"]];
    NSMutableArray* tempStylesMA = [[NSMutableArray alloc] init];
    styles = [[NSMutableArray alloc] init];
    for(NSData* encodedObject in tempStyles)
        [tempStylesMA addObject:[self decodeObject:encodedObject]];
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"style"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    styles = [[NSArray alloc] initWithArray:tempStylesMA];
    styles = [styles sortedArrayUsingDescriptors:sortDescriptors];
}

-(CAStyles*)decodeObject:(NSData*) encodedObject
{
    CAStyles* unencodedObject = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return unencodedObject;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return styles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"style";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    CAStyles* currentStyle = [styles objectAtIndex:indexPath.row];
    
    UILabel* styleLbl = (UILabel*)[cell viewWithTag:1];
    UILabel* OGlbl = (UILabel*)[cell viewWithTag:2];
    UILabel* FGlbl = (UILabel*)[cell viewWithTag:3];
    UILabel* IBUlbl = (UILabel*)[cell viewWithTag:4];
    UILabel* Llbl = (UILabel*)[cell viewWithTag:5];
    UILabel* ABVlbl = (UILabel*)[cell viewWithTag:6];
    
    NSLog(@"%@", currentStyle.style);
    
    styleLbl.text = currentStyle.style;
    OGlbl.text = [currentStyle.OG stringValue];
    FGlbl.text = [currentStyle.FG stringValue];
    IBUlbl.text = [currentStyle.IBU stringValue];
    Llbl.text = [currentStyle.L stringValue];
    ABVlbl.text = [currentStyle.ABV stringValue];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
