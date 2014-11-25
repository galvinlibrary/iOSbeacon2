//
//  ViewController.m
//  BeaconReceiver
//
//  Created by Paul Go on 11/10/14.
//  Copyright (c) 2014 Paul Go. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString: @"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:@"net.learn2develop.myRegion"];
    
    
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
    
    self.lblStatus.text = @"Entered region";
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.alertBody = @"You have entered the region you are monitoring";
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    localNotification.alertAction = @"Details";
    
    [[UIApplication sharedApplication]presentLocalNotificationNow:localNotification];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    self.lblStatus.text = @"Exited region";
    self.lblBeaconFound.text = @"No";
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region{
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];
    
    self.lblBeaconFound.text = @"Yes";
    self.lblUUID.text = beacon.proximityUUID.UUIDString;
    self.lblMajor.text = [NSString stringWithFormat:@"%@", beacon.major];
    self.lblMinor.text = [NSString stringWithFormat:@"%@", beacon.minor];
    self.lblAccuracy.text = [NSString stringWithFormat:@"%f meters", beacon.accuracy];
    
    switch (beacon.proximity){
        case CLProximityUnknown:self.lblDistance.text = @"Unknown Proximity";
            break;
        case CLProximityImmediate:self.lblDistance.text = @"Immediate";
            break;
        case CLProximityNear:self.lblDistance.text = @"Near";
            break;
        case CLProximityFar:self.lblDistance.text = @"Far";
            break;
            
    }
    self.lblRSSI.text = [NSString stringWithFormat:@"%li decibels",(long)beacon.rssi];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
