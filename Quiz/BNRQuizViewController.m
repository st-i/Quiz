//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by iStef on 01.01.17.
//  Copyright © 2017 St. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (copy, nonatomic) NSArray *questions;
@property (copy, nonatomic) NSArray *answers;

@property (weak, nonatomic) IBOutlet UIButton *questionButton;
@property (weak, nonatomic) IBOutlet UIButton *answerButton;


@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;


@end


@implementation BNRQuizViewController

-(void)animateLabel:(UILabel *)label withString:(NSString *)string
{
    CGRect currentRect=label.frame;
    
    CGRect leftRect=currentRect;
    leftRect.origin.x=0-label.frame.size.width;
    
    CGRect rightRect=currentRect;
    rightRect.origin.x=[[UIScreen mainScreen]bounds].size.width;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        label.frame=rightRect;
        label.alpha=0.0;
    }completion:^(BOOL finished){
        label.text=string;
        label.frame=leftRect;
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            label.frame=currentRect;
            label.alpha=1.0;
        }completion:NULL];
    }];
}

/*-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    int qX=self.questionButton.frame.origin.x;
    int qY=self.questionButton.frame.origin.y-(self.questionButton.frame.size.height+8);
    int qWidth=self.questionButton.frame.size.width;
    int qHeight=self.questionButton.frame.size.height;
    
    self.questionLabel.frame=CGRectMake(qX, qY, qWidth, qHeight);
    
    //self.questionLabel.frame=CGRectMake(-40, 111, 288, 54);
}*/

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions=@[@"From what is cognac made?",
                         @"What is 7+7?",
                         @"What is the capital of Vermont?"];
        self.answers=@[@"Grapes",
                       @"14",
                       @"Montpelier"];
    }
    return self;
}


- (IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex==[self.questions count]) {
        self.currentQuestionIndex=0;
    }
    
    NSString *question=self.questions[self.currentQuestionIndex];
    
    [self animateLabel:self.questionLabel withString:question];
    
    if (![self.answerLabel.text isEqualToString:@"???"]) {
        [self animateLabel:self.answerLabel withString:@"???"];
    }
    
    //self.questionLabel.text=question;
    //self.answerLabel.text=@"???";
    
    /*self.questionLabel.alpha=0.0;
    
    
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.questionLabel.alpha=1.0;
    }completion:NULL];
    
    if (sender) {

    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:0 animations:^{
        //CGRect qFrame=CGRectMake(self.questionButton.frame.origin.x, self.questionLabel.bounds.origin.y, self.questionLabel.bounds.size.width, self.questionLabel.bounds.size.height);
        CGRect qFrame=CGRectMake(16, 111, 288, 54);
        self.questionLabel.frame=qFrame;
        
    }completion:NULL];
    }*/
    
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer=self.answers[self.currentQuestionIndex];
    //self.answerLabel.text=answer;
    
    [self animateLabel:self.answerLabel withString:answer];
}



@end
