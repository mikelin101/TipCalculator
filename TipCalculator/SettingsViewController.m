//
//  SettingsViewControlerViewController.m
//  TipCalculator
//
//  Created by  Michael Lin on 1/9/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"default_tip"];
}

- (IBAction)onTipChanged:
(UISegmentedControl *)sender {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"default_tip"];
    [defaults synchronize];
}

@end
