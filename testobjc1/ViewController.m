//
//  ViewController.m
//  testobjc1
//
//  Created by Adrian Khor on 02/05/2021.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *name;
@property (nonatomic) int age;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameInfoTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initializes the 'name' property and give it an initial value
    //self.name = [[NSString alloc]initWithString:@"Hello "];
    // The "modern way"
    self.name = @"Hello ";
    self.age = 42;
    
    // Calls the NSString function stringByAppendingString against the name
    // property of the ViewController class
    [self.name stringByAppendingString:@"Test"];
    
    // Calls the foo function and pass the appropriate arguments.
    [self foo: @"Some string" :42];
    
    // Logs a value to the console
    // %@ means NSString, %s means char*, etc
    NSLog(@"Name is: %@", self.name);
    
    //
    [self.nameTextField setText:self.name];
}


- (int)foo:(NSString*) bar : (int) baz {
    return baz;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Informs the view that editing is done - and dismisses the keyboard
    // if it is open.
    [self.view endEditing:YES];
}

-(void)setInfoMessage:(NSString*) message {
    [self.nameInfoTextField setText:[NSString stringWithFormat:@"%@", message]];
}
                                     
- (IBAction)buttonClicked:(id)sender {
    // Returns NO if length <= 0
    BOOL isNameEmpty = ![self.nameTextField text].length;
    
    // Show an error message if name is empty
    if(isNameEmpty) {
        [self setInfoMessage:@"Name is empty!"];
        return;
    }
    
    // Sets the label text to include the length of the name
    [self setInfoMessage:[NSString stringWithFormat:@"Name length: %ld",[self.nameTextField text].length]];
}
@end
