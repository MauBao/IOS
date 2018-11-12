//
//  ViewController.h
//  StopWatch
//
//  Created by Ngo Mau Bao on 11/12/18.
//  Copyright © 2018 Ngo Mau Bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *myTimer;
    BOOL running;
    int count;
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *reserBtn;

- (void)updateTimer;

- (IBAction)startBtnPushed:(id)sender;
- (IBAction)resetBtnPushed:(id)sender;

@end

