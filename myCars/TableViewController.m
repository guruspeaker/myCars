//
//  TableViewController.m
//  myCars
//
//  Created by PAUL CHRISTIAN on 12/14/17.
//  Copyright © 2017 PAUL CHRISTIAN. All rights reserved.
//

#import "TableViewController.h"
#import "AddCarViewController.h"

@interface TableViewController ()
@property (strong) NSMutableArray *cars;
@end

@implementation TableViewController

- (void)viewDidLoad
    {
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    
        
        
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Vehicle"];
    self.cars = [[context executeFetchRequest:fetchRequest error:nil]mutableCopy];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [self.cars count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CarCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSManagedObjectModel *aCar = [self.cars objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@",[aCar valueForKey:@"make"],[aCar valueForKey:@"model"]]];
    
    NSString *year = [NSString stringWithFormat:@"%@", [aCar valueForKey:@"year"]];
    [cell.detailTextLabel setText:year];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
            // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [context deleteObject:[self.cars objectAtIndex:indexPath.row]];
        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"%@ %@", error, [error localizedDescription]);
        }
        [self.cars removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
*/
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
     
     if ([[segue identifier] isEqualToString:@"UpdateCarInfo"])
     {
         NSManagedObjectModel *selectedCar =
            [self.cars objectAtIndex:
                [[self.tableView indexPathForSelectedRow]row]];
         AddCarViewController *updateCarView = segue.destinationViewController;
         updateCarView.aCar = selectedCar;
     }
}
@end
