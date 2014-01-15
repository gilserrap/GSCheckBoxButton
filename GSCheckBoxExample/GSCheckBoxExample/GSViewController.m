//
//  GSViewController.m
//  GSCheckBoxExample
//
//  Created by Gil Serra on 15/01/14.
//  Copyright (c) 2014 Gil Serra. All rights reserved.
//

#import "GSViewController.h"
#import "GSCheckBoxButton.h"

@interface GSViewController ()

@property (weak, nonatomic) IBOutlet GSCheckBoxButton *checkBox;
@property (strong, nonatomic) GSCheckBoxButton *programaticallyCreatedCheckBox;

@end

static inline void logText(NSString *text) {
    NSLog(@"%@", text);
}

@implementation GSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.checkBox onTextPressed:^{
        logText(@"Storyboard created button text pressed!");
    } onCheckBoxPressed:^(BOOL isChecked) {
        logText(@"Storyboard created button text check box pressed!");
    }];
    
    self.programaticallyCreatedCheckBox =
        [GSCheckBoxButton buttonWithFrame:CGRectMake(24, 90, 273, 27) onTextPressed:^{
            logText(@"Programatically created button text pressed!");
        } onCheckBoxPressed:^(BOOL isChecked) {
            logText(@"Programatically created button check box pressed!");
        }];
    [self.view addSubview:self.programaticallyCreatedCheckBox];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
