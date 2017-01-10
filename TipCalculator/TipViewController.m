//
//  ViewController.m
//  TipCalculator
//
//  Created by  Michael Lin on 1/9/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"default_tip"];
    
    [self updateValues];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    // Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // Compute the tip and total
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    // Update the UI
    self.tipLabel.text = [NSString stringWithFormat: @"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat: @"$%0.2f", totalAmount];
}

@end
