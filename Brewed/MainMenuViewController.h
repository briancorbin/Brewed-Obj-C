//
//  MainMenuViewController.h
//  Brewed
//
//  Created by Brian Corbin on 7/30/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CAStyles.h"

@interface MainMenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingDatabaseAI;

@end
