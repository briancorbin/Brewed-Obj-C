
//
//  NewRecipeViewController.m
//  Brewed
//
//  Created by Brian Corbin on 7/30/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import "NewRecipeViewController.h"

@interface NewRecipeViewController ()

@end

@implementation NewRecipeViewController

@synthesize fermentablesTableView, hopsTableView, yeastTableView, extrasTableView, recipeNameTF, selectionSC, scrollView, bbsizeTableView, mashStepsTableView;

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
    
    [scrollView setFrame:CGRectMake(scrollView.frame.origin.x, scrollView.frame.origin.y, 768, scrollView.frame.size.height)];
    [scrollView setContentSize:CGSizeMake(3840, scrollView.frame.size.height)];
    
    // Do any additional setup after loading the view.
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
    if(tableView == fermentablesTableView)
        return 2;
    if(tableView == hopsTableView)
        return 2;
    if(tableView == yeastTableView)
        return 2;
    if(tableView == extrasTableView)
        return 2;
    if(tableView == mashStepsTableView)
        return 2;
    if(tableView == bbsizeTableView)
        return 5;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(tableView == fermentablesTableView)
    {
        if(indexPath.row == 0)
            cell = [tableView dequeueReusableCellWithIdentifier:@"header" forIndexPath:indexPath];
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"fermentable" forIndexPath:indexPath];
            UITextField* amtTF = (UITextField*)([cell viewWithTag:1]);
            amtTF.userInteractionEnabled = YES;
        }
    }
    
    if(tableView == hopsTableView)
    {
        if(indexPath.row == 0)
            cell = [tableView dequeueReusableCellWithIdentifier:@"header" forIndexPath:indexPath];
        else
            cell = [tableView dequeueReusableCellWithIdentifier:@"hops" forIndexPath:indexPath];
    }
    
    if(tableView == yeastTableView)
    {
        if(indexPath.row == 0)
            cell = [tableView dequeueReusableCellWithIdentifier:@"header" forIndexPath:indexPath];
        else
            cell = [tableView dequeueReusableCellWithIdentifier:@"yeast" forIndexPath:indexPath];
    }
    
    if(tableView == extrasTableView)
    {
        if(indexPath.row == 0)
            cell = [tableView dequeueReusableCellWithIdentifier:@"header" forIndexPath:indexPath];
        else
            cell = [tableView dequeueReusableCellWithIdentifier:@"extras" forIndexPath:indexPath];
    }
    
    if(tableView == bbsizeTableView)
    {
        NSArray* reuseIds = [[NSArray alloc] initWithObjects:@"batchSize", @"boilTime", @"evaporationRate", @"topUpWater", @"calculatedBoilSize", nil];
        NSLog(@"%@", [reuseIds objectAtIndex:0]);
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIds[indexPath.row] forIndexPath:indexPath];
    }
    
    if(tableView == mashStepsTableView)
    {
        if(indexPath.row == 0)
            cell = [tableView dequeueReusableCellWithIdentifier:@"header" forIndexPath:indexPath];
        else
            cell = [tableView dequeueReusableCellWithIdentifier:@"mash steps" forIndexPath:indexPath];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)selectionSCaction:(id)sender {
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * selectionSC.selectedSegmentIndex;
    frame.origin.y = self.scrollView.frame.origin.y;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}
@end
