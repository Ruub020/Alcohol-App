//
//  LandenViewController.m
//  MID
//
//  Created by Boike Damhuis on 19-01-14.
//  Copyright (c) 2014 Cawwi Development. All rights reserved.
//

#import "LandenViewController.h"

@interface LandenViewController ()

@end

@implementation LandenViewController
@synthesize content = _content;
-(NSArray *)content
{
    if (!_content) {
        _content = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"alcohollanden" ofType:@"plist"]];
    }
    return _content;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if( cell == nil )
    {
        NSLog(@"Cell Creation");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }

    
    cell.textLabel.text = [[self.content objectAtIndex:indexPath.row] valueForKey:@"Land"];
    cell.detailTextLabel.text = [[self.content objectAtIndex:indexPath.row] valueForKey:@"Promil"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *ChosenCountry = cell.textLabel.text;
    NSString *Prommilage = cell.detailTextLabel.text;
    NSString *MessageBody = [NSString stringWithFormat:@"%@%@%@",@"You have set ", ChosenCountry, @" as default country"];
    
    
    UIAlertView *Chosen = [[UIAlertView alloc] initWithTitle:nil message:MessageBody delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [Chosen show];
    
    [[NSUserDefaults standardUserDefaults] setObject:ChosenCountry forKey:@"COUNTRY"];
    [[NSUserDefaults standardUserDefaults] setObject:Prommilage forKey:@"PROMMILAGE"];
    
    country = [ChosenCountry floatValue];
    promile = [Prommilage floatValue];
    
    [[NSUserDefaults standardUserDefaults] setFloat:country forKey:@"CountryKey"];
    [[NSUserDefaults standardUserDefaults] setFloat:promile forKey:@"PromileKey"];
    

}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
