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
@property (weak, nonatomic) IBOutlet UITextView *foodname;
@property (weak, nonatomic) IBOutlet UITextView *foodage;

@end

@implementation ViewController
//@synthesize foods;
@synthesize flashcardviewer;
@synthesize int_counter;
@synthesize foodname;
@synthesize foodage;

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
    NSArray *foodnamelist = @[@"Broccoli", @"Carrot", @"Dumpling"];
    UIImage *image = foods[0];
    [flashcardviewer setImage:image];
    foodname.text = foodnamelist[0];
    NSInteger randomNumber = arc4random() % 18 + 20;
    foodage.text = [NSString stringWithFormat:@"%i", randomNumber];
    
//    flashcardviewer = [[UIImageView alloc]init];

}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    NSArray *foods = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"broccoli.png"],
                      [UIImage imageNamed:@"carrot.png"],
                      [UIImage imageNamed:@"dumpling.png"],
                      nil];
    NSArray *foodnamelist = @[@"Broccoli", @"Carrot", @"Dumpling"];
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        int_counter++;
        NSLog(@"%i",int_counter);
        if(int_counter >=0 && int_counter<=2){
            UIImage *image = foods[int_counter];
            [flashcardviewer setImage:image];
            foodname.text = foodnamelist[int_counter];
            NSInteger randomNumber = arc4random() % 18 + 20;
            foodage.text = [NSString stringWithFormat:@"%i", randomNumber];
        }
    }
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        int_counter--;
        NSLog(@"%i",int_counter);
        if(int_counter >=0 && int_counter<=2){
            UIImage *image = foods[int_counter];
            [flashcardviewer setImage:image];
            foodname.text = foodnamelist[int_counter];
            NSInteger randomNumber = arc4random() % 18 + 20;
            foodage.text = [NSString stringWithFormat:@"%i", randomNumber];
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
