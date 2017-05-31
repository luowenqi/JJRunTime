//
//  NSObject+HMRuntime.m
//  04-Runtime
//
//  Created by 罗文琦 on 2017/5/7.
//  Copyright © 2017年 罗文琦. All rights reserved.

#import "ViewController.h"

#import "NSObject+JJRuntime.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSLog(@"%@",[self.datePicker getPropertyList]);
    NSLog(@"%@",[self.datePicker getPropertyAndValueList]);
    NSLog(@"%@",[self.datePicker getMethodList]);
    [self.datePicker setValue:[UIColor redColor] forKey:@"textColor"];
    [self.datePicker setValue:[UIColor blackColor] forKey:@"textShadowColor"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
