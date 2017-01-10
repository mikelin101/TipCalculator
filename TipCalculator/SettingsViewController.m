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
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"default_tip"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTipChanged:
(UISegmentedControl *)sender {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"default_tip"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
