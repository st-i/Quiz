//
//  ViewController.m
//  Quiz
//
//  Created by iStef on 08.11.16.
//  Copyright © 2016 St. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;


@end

@implementation ViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //call the init method implemented by the superclass
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        _questions=[[NSArray alloc]init];
        _answers=[[NSArray alloc]init];
        
        _questions=@[@"From what is cognac?",
                         @"What is 7+7?",
                         @"What is the capital of Vermont?"];
        _answers=@[@"Grapes",
                       @"14",
                       @"Montpelier"];
    }
    //return the address of the new object
    return self;
}

-(IBAction)showQuestion:(id)sender
{
    //step to the next question
    self.currentQuestionIndex++;
    
    //Am I past the last question?
    if (self.currentQuestionIndex==[_questions count]) {
        //go back to the first question
        self.currentQuestionIndex=0;
    }
    //get the string at that index in the questions array
    NSString *question=self.questions[self.currentQuestionIndex];
    
    //display the string in the question label
    self.questionLabel.text=question;
    
    //reset the answer label
    self.answerLabel.text=@"???";
}

-(IBAction)showAnswer:(id)sender
{
    NSString *answer=_answers[self.currentQuestionIndex];
    
    self.answerLabel.text=answer;
}

@end
