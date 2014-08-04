//
//  NewRecipeViewController.h
//  Brewed
//
//  Created by Brian Corbin on 7/30/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NewRecipeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *fermentablesTableView;
@property (weak, nonatomic) IBOutlet UITableView *hopsTableView;
@property (weak, nonatomic) IBOutlet UITableView *yeastTableView;
@property (weak, nonatomic) IBOutlet UITableView *extrasTableView;
@property (weak, nonatomic) IBOutlet UITableView *bbsizeTableView;
@property (weak, nonatomic) IBOutlet UITableView *mashStepsTableView;
@property (weak, nonatomic) IBOutlet UITextField *recipeNameTF;
@property (weak, nonatomic) IBOutlet UITextView *recipeNotesTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectionSC;

- (IBAction)selectionSCaction:(id)sender;

@end
