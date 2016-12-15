//
//  ViewController.m
//  SearchTableviewDemo
//
//  Created by Hexagon on 05/09/16.
//  Copyright © 2016 Hexagon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr_search_State_Searched = [[NSMutableArray alloc]init];
    arr_StateList = [[NSMutableArray alloc]initWithObjects:@"Gujarat",@"Maharastra",@"Punjab",@"Rajsthan",@"Delhi",@"Chennai",@"Jammu",@"Kerala",@"Tamilnadu",@"Jharkhand",nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (arr_search_State_Searched.count == 0 )
    {
            return arr_StateList.count;
    }
    else
            return arr_search_State_Searched.count;
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    txt_search.text = @"";
    if(textField == txt_search)
    {
        // txt_SearchCity.text = @"";
        strTemp = @"";
        [arr_search_State_Searched removeAllObjects];
        [tbl_search reloadData];
    }
    
}
-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == txt_search)
    {
        NSInteger counter = 0;
        if ([string isEqualToString:@""] )
        {
            strTemp = [strTemp substringToIndex:[strTemp length] - 1];
        }
        else
        {
            strTemp=(NSMutableString *)[strTemp stringByAppendingString:string];
        }
        [arr_search_State_Searched removeAllObjects];
        
        
        for(int s=0; s<[arr_StateList count]; s++)
        {
            NSString *name=[arr_StateList objectAtIndex:s];
            NSRange r;
            
            r =[[name lowercaseString] rangeOfString:[strTemp lowercaseString]];
            if(r.location != NSNotFound)
            {
                [arr_search_State_Searched  addObject:[arr_StateList objectAtIndex:s]];
            }
            counter++;
            
        }
        if(strTemp.length == 0)
        {
            textField.text = @"";
            strTemp = @"";
            [textField resignFirstResponder];
            
            [arr_search_State_Searched removeAllObjects];
            
        }
        [tbl_search reloadData];
    }
    
    
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            
        }
        if (arr_search_State_Searched.count == 0)
        {
            cell.textLabel.text = [arr_StateList objectAtIndex:indexPath.row];
            cell.textLabel.textColor = [UIColor blackColor];
            
        }
        else
        {
            cell.textLabel.text = [arr_search_State_Searched objectAtIndex:indexPath.row];
            cell.textLabel.textColor = [UIColor grayColor];
        }
    
    
    
    return  cell;
    
}
@end
