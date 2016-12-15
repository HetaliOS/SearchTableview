//
//  ViewController.h
//  SearchTableviewDemo
//
//  Created by Hexagon on 05/09/16.
//  Copyright © 2016 Hexagon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    __weak IBOutlet UITextField *txt_search;
    __weak IBOutlet UITableView *tbl_search;
    
    NSMutableArray *arr_search_State_Searched;
    NSMutableArray *arr_StateList;
    
    
    NSString *strTemp;

}

@end

