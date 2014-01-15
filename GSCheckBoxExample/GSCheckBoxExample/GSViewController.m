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

@property (weak, nonatomic) GSCheckBoxButton *programaticallyCreatedCheckBox;

@end

@implementation GSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
