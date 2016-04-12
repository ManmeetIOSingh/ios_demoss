//
//  ViewController.m
//  Demo_Picker
//
//  Created by geniemac5 on 05/04/16.
//  Copyright © 2016 genie. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize pickerViewPopup,picker;
@synthesize dataArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    dataArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [dataArray addObject:@"One"];
    [dataArray addObject:@"Two"];
    [dataArray addObject:@"Three"];
    [dataArray addObject:@"Four"];
    [dataArray addObject:@"Five"];
    
    pickerViewPopup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    
    categoryPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    
    [categoryPickerView setDataSource: self];
    [categoryPickerView setDelegate: self];
    categoryPickerView.showsSelectionIndicator = YES;
    
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(categoryDoneButtonPressed)];
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(categoryCancelButtonPressed)];
    
    [pickerToolbar setItems:@[cancelBtn, flexSpace, doneBtn] animated:YES];
    
    [pickerViewPopup addSubview:pickerToolbar];
    [pickerViewPopup addSubview:picker];
    [pickerViewPopup showInView:self.view];
    [pickerViewPopup setBounds:CGRectMake(0,0,320, 464)];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    
    NSLog(@"%@",[dataArray objectAtIndex:row]);
    //selectedCategory = [NSString stringWithFormat:@"%@",[dataArray objectAtIndex:row]];
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [dataArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [dataArray objectAtIndex: row];
    
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 300;
    
    return sectionWidth;
}

-(void)categoryDoneButtonPressed{
   // categoryLable.text = selectedCategory;
    [pickerViewPopup dismissWithClickedButtonIndex:1 animated:YES];
}

-(void)categoryCancelButtonPressed{
    [pickerViewPopup dismissWithClickedButtonIndex:1 animated:YES];
}
@end
