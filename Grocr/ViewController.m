//
//  ViewController.m
//  Grocr
//
//  Created by Sarah Nagy on 7/7/14.
//  Copyright (c) 2014 Sarah Nagy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *flashcardviewer;
@property (strong, nonatomic) NSArray* foods;
@property (nonatomic) NSUInteger int_counter;

@end

@implementation ViewController
@synthesize foods;
@synthesize flashcardviewer;
@synthesize int_counter;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // instantiate gesture recognizer
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    //setup images
    foods = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"broccoli.png"],
                     [UIImage imageNamed:@"carrot.png"],
                     [UIImage imageNamed:@"dumpling.png"],
                     nil];
    
    flashcardviewer = [[UIImageView alloc]init];

}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    //Do what you want here
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    //Avoid possible app crash with a if condition
    if (int_counter < foods.count) {
        UIImage *flashcard_next = [foods objectAtIndex:int_counter];
        flashcardviewer.image = flashcard_next;
        int_counter++;
    } else {
        NSLog (@"No more cards");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
    NSLog(@"Pressed!");
}



@end
