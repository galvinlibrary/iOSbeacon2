//
//  DetailViewController.h
//  PopNotification
//
//  Created by Paul Go on 2/25/15.
//  Copyright (c) 2015 Paul Go. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

