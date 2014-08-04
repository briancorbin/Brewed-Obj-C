//
//  MainMenuViewController.m
//  Brewed
//
//  Created by Brian Corbin on 7/30/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize loadingDatabaseAI;

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
    
    [loadingDatabaseAI startAnimating];
    
    NSMutableArray* styles = [[NSMutableArray alloc] init];
    PFQuery* query = [PFQuery queryWithClassName:@"Styles"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         NSLog(@"Starting Query");
         if(!error)
         {
             NSLog(@"Querying");
             for(PFObject* object in objects)
             {
                 CAStyles* style = [[CAStyles alloc] init];
                 style.style = object[@"Style"];
                 style.OG = object[@"OG"];
                 style.FG = object[@"FG"];
                 style.IBU = object[@"IBU"];
                 style.L = object[@"L"];
                 style.ABV = object[@"ABV"];
                 
                 NSData* encodedObject = [self encodeObject:style];
                 [styles addObject:encodedObject];
             }
         }
         [[NSUserDefaults standardUserDefaults] setObject:styles forKey:@"styles"];
         [loadingDatabaseAI stopAnimating];
     }];
    NSLog(@"Finished Query");
}

-(NSData*)encodeObject:(CAStyles*) object
{
    NSData* encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    return encodedObject;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
