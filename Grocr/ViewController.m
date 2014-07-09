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
//@property (strong, nonatomic) NSArray* foods;
@property (nonatomic) NSUInteger int_counter;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;

@end

@implementation ViewController
//@synthesize foods;
@synthesize flashcardviewer;
@synthesize int_counter;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // instantiate gesture recognizer
    
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
    //setup images
    NSArray *foods = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"broccoli.png"],
                     [UIImage imageNamed:@"carrot.png"],
                     [UIImage imageNamed:@"dumpling.png"],
                     nil];
    UIImage *image = foods[0];
    [flashcardviewer setImage:image];
    
//    flashcardviewer = [[UIImageView alloc]init];

}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    NSArray *foods = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"broccoli.png"],
                      [UIImage imageNamed:@"carrot.png"],
                      [UIImage imageNamed:@"dumpling.png"],
                      nil];
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        CGPoint labelPosition = CGPointMake(self.swipeLabel.frame.origin.x - 100.0, self.swipeLabel.frame.origin.y);
        self.swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height);
        int_counter--;
        NSLog(@"%i",int_counter);
        if(int_counter >=0 && int_counter<=2){
            UIImage *image = foods[int_counter];
            [flashcardviewer setImage:image];
        }
    }
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        CGPoint labelPosition = CGPointMake(self.swipeLabel.frame.origin.x + 100.0, self.swipeLabel.frame.origin.y);
        self.swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height);
        int_counter++;
        NSLog(@"%i",int_counter);
        if(int_counter >=0 && int_counter<=2){
            UIImage *image = foods[int_counter];
            [flashcardviewer setImage:image];
        }
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
