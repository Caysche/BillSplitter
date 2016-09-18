//
//  ViewController.m
//  BillSplitter
//
//  Created by Cay Cornelius on 17/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputBillAmount;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultOfCalculation;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateButton:(UIButton *)sender {
    NSDecimalNumber *billAmount = [NSDecimalNumber decimalNumberWithString:self.inputBillAmount.text];
    NSDecimalNumber *numberOfPeople = [[NSDecimalNumber alloc] initWithFloat:floorf(self.numberOfPeopleSlider.value)];
    NSDecimalNumber *resultNumber = [billAmount decimalNumberByDividingBy:numberOfPeople];
    NSString *resultString = [NSNumberFormatter localizedStringFromNumber: resultNumber numberStyle:NSNumberFormatterCurrencyStyle];
    self.resultOfCalculation.text = resultString;
}
- (IBAction)sliderValueChanged:(UISlider *)sender {
    [self.numberOfPeopleSlider addTarget:self action:@selector(numberOfPeopleSliderChanged) forControlEvents:UIControlEventValueChanged];
}

- (float)numberOfPeopleSliderChanged {
    NSString *labelString = [NSString stringWithFormat:@"%.0f", floor(self.numberOfPeopleSlider.value)];
    self.numberOfPeopleLabel.text = labelString;
    return floorf(self.numberOfPeopleSlider.value * 2.0) * 1;
}

@end
