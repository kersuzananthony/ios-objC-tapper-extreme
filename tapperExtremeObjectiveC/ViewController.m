//
//  ViewController.m
//  tapperExtremeObjectiveC
//
//  Created by Kersuzan on 05/02/2016.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *tapperImage;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *coinButton;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

NSInteger maxTap = 0;
NSInteger currentTap = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playPressed:(UIButton *)sender {
    
    if ([self.textField.text isEqualToString:@""]) {
        NSLog(@"No input found!");
    } else {
        maxTap = [self.textField.text integerValue];
        
        self.textField.hidden = YES;
        self.playButton.hidden = YES;
        self.tapperImage.hidden = YES;
        
        self.textLabel.hidden = NO;
        self.coinButton.hidden = NO;
        
        [self updateTextlabel];
    }
    
}

- (IBAction)coinPressed:(UIButton *)sender {
    
    currentTap++;
    [self updateTextlabel];
    
    if ([self isGameOver]) {
        [self startGame];
    }
}









- (void) startGame {

    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://www.google.com"]]];
    
    currentTap = 0;
    
    self.coinButton.hidden = YES;
    self.textLabel.hidden = YES;
    
    self.textField.hidden = NO;
    self.playButton.hidden = NO;
    self.tapperImage.hidden = NO;
    
    [self updateTextlabel];
    
    self.textField.text = @"";
}

- (void)updateTextlabel {
    self.textLabel.text = [NSString stringWithFormat:@"%ld Taps", (long)currentTap];
}

-(BOOL) isGameOver {
    
    if (currentTap >= maxTap) {
        return YES;
    } else {
        return NO;
    }
    
}

@end
