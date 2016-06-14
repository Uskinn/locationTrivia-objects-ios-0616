//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)allLocationNames{
    
    NSMutableArray *allNames = [[NSMutableArray alloc]init];
    
    for (FISLocation *object in self.locations) {
        
        [allNames addObject:object.name];
    }
    return allNames;
}

- (FISLocation *)locationNamed:(NSString *)name {
    
    for (FISLocation *object in self.locations) {
        
        if ([object.name isEqualToString:name]) {
            
            return object;
        }
    }
    
    return nil;
}

- (NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    
    NSMutableArray *locMargin = [[NSMutableArray alloc]init];
    
    for (FISLocation *location in self.locations) {
        
        if (fabs(location.longitude + longitude) <= margin || fabs(location.latitude - latitude) <= margin) {
            
            if (fabs(location.longitude + longitude) <= margin || fabs(location.longitude - longitude) <= margin) {
                
                [locMargin addObject:location];
            }
        }
    }
    return locMargin;
}

@end
