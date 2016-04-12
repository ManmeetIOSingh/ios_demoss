//
//  ViewController.h
//  Demo_Picker
//
//  Created by geniemac5 on 05/04/16.
//  Copyright © 2016 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIActionSheet *pickerViewPopup;
    UIPickerView *categoryPickerView;
    UIPickerView *pickerView;
    NSMutableArray *dataArray;
}
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, retain) UIActionSheet *pickerViewPopup;

@property (nonatomic, retain) NSMutableArray *dataArray;
@end

