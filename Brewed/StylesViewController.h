//
//  StylesViewController.h
//  Brewed
//
//  Created by Brian Corbin on 8/4/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAStyles.h"
#import <Parse/Parse.h>

@interface StylesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *stylesTableView;
@property (strong, nonatomic) NSArray* styles;

@end
