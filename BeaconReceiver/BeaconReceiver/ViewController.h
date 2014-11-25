//
//  ViewController.h
//  BeaconReceiver
//
//  Created by Paul Go on 11/10/14.
//  Copyright (c) 2014 Paul Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblBeaconFound;
@property (weak, nonatomic) IBOutlet UILabel *lblUUID;
@property (weak, nonatomic) IBOutlet UILabel *lblMajor;
@property (weak, nonatomic) IBOutlet UILabel *lblMinor;
@property (weak, nonatomic) IBOutlet UILabel *lblAccuracy;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance;
@property (weak, nonatomic) IBOutlet UILabel *lblRSSI;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@end

