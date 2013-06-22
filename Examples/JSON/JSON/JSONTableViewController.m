//
//  JSONTableViewController.m
//  JSON
//
//  Created by Tim Moose on 6/6/13.
//  Copyright (c) 2013 Tractable Labs. All rights reserved.
//

#import "JSONTableViewController.h"
#import "TLIndexPathDataModel.h"

@implementation JSONTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //simulated JSON response as an array of dictionaries
    NSArray *jsonData = @[
        @{
            @"id": @(58),
            @"title": @"title59",
            @"summary": @"summary59",
            @"datetime": @"2013.02.03",
        },
        @{
            @"id": @(57),
            @"title": @"title58",
            @"summary": @"summary58",
            @"datetime": @"2013.02.04",
        },
        @{
            @"id": @(56),
            @"title": @"title57",
            @"summary": @"summary57",
            @"datetime": @"2013.02.04",
        },
        @{
            @"id": @(55),
            @"title": @"title56",
            @"summary": @"summary56",
            @"datetime": @"2013.02.05",
        }
    ];
    //initialize index path controller with a data model containing JSON data.
    //using "datetime" as the `sectionNameKeyPath` automatically groups items
    //by "datetime".
    self.indexPathController.dataModel = [[TLIndexPathDataModel alloc] initWithItems:jsonData
                                                            andSectionNameKeyPath:@"datetime"
                                                             andIdentifierKeyPath:@"id"];
}

- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [self.indexPathController.dataModel itemAtIndexPath:indexPath];
    cell.textLabel.text = dict[@"title"];
    cell.detailTextLabel.text = dict[@"summary"];
}

@end
