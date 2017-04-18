
#import <CoreLocation/CoreLocation.h>

%hook StatisticalListViewController

// Hooking an instance method with an argument.
- (void)locationManager:(id)arg1 didUpdateLocations:(id)arg2 {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	//CLLocation *wanda = [[CLLocation alloc] initWithLatitude:23.01045563 longitude:113.34227242];

	NSMutableArray * tempArray = [NSMutableArray array];
	double wei = 23.01045 + arc4random_uniform(1000) * 0.00000001;
    double jing = 113.34227 + (arc4random_uniform(300) + 200) * 0.00000001;
    for (CLLocation * location in arg2) {
        CLLocation * newLocation = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(wei, jing) altitude:location.altitude horizontalAccuracy:location.horizontalAccuracy verticalAccuracy:location.verticalAccuracy course:location.course speed:location.speed timestamp:location.timestamp];
        [tempArray addObject:newLocation];
    }
    NSArray * newLocations = [NSArray arrayWithArray:tempArray];

	//NSArray *locs = @[wanda];

	%orig(arg1, newLocations); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

%end
