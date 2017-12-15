//
//  AddCarViewController.m
//  myCars
//
//  Created by PAUL CHRISTIAN on 12/14/17.
//  Copyright © 2017 PAUL CHRISTIAN. All rights reserved.
//

#import "AddCarViewController.h"
#import "Vehicle+CoreDataClass.h"

@interface AddCarViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtMake;
@property (weak, nonatomic) IBOutlet UITextField *txtModel;
@property (weak, nonatomic) IBOutlet UITextField *txtYear;
@property (weak, nonatomic) IBOutlet UITextField *txtMPG;

@end

@implementation AddCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    
    if(self.aCar){
        self.txtMake.text = [self.aCar valueForKey:@"make"];
        self.txtModel.text = [self.aCar valueForKey:@"model"];
        
        NSNumber *numYear = [self.aCar valueForKey:@"year"];
        NSString *year = [NSString stringWithFormat:@"%@",numYear];
        self.txtYear.text = year;
        
        NSNumber *numMPG = [self.aCar valueForKey:@"mpg"];
        NSString *mpg = [NSString stringWithFormat:@"%@",numMPG];
        self.txtMPG.text = mpg;
        
        NSLog(@"Self.aCar is a go and looks like this: %@",self.aCar);
        
    }
    else
    NSLog(@"Self.aCar is a NOGO and looks like this: %@",self.aCar);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveRecord:(UIButton *)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterNoStyle];
    NSNumber *myYear = [f numberFromString:self.txtYear.text];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *myMPG = [f numberFromString:self.txtMPG.text];
    
    if(self.aCar) // Update
    {
        [self.aCar setValue:self.txtMake.text forKey:@"make"];
        [self.aCar setValue:self.txtModel.text forKey:@"model"];
        [self.aCar setValue:myYear forKey:@"year"];
        [self.aCar setValue:myMPG forKey:@"mpg"];
        NSLog (@"aCar Updated: %@", _aCar);
        
    }
    else // Add
    {
        Vehicle *myCar = [[Vehicle alloc]initWithContext:context];

        myCar.make = self.txtMake.text;
        myCar.model = self.txtModel.text;
        [myCar setValue:myYear forKey:@"year"];
        [myCar setValue:myMPG forKey:@"mpg"];
        NSLog (@"My Car Added: %@", myCar);
    }
    // clear fields
    self.txtModel.text = @"";
    self.txtMake.text = @"";
    self.txtMPG.text = @"";
    self.txtYear.text = @"";
    
    NSError *error = nil;
    if (![context save:&error])
    {
        NSLog(@"%@ %@", error, [error localizedDescription]);
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)dismissKeyboard:(id)sender {
}

@end
