//
//  ViewController.h
//  Grocr
//
//  Created by Sarah Nagy on 7/7/14.
//  Copyright (c) 2014 Sarah Nagy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView *flashcardviewer;
    NSArray* foods;
    NSUInteger int_counter;
}

- (IBAction)buttonPressed;

@end
