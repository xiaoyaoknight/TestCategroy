
#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (void)load {
    NSLog(@"Person -------------- load");
}

+ (void)initialize {
    NSLog(@"Person -------------- initialize");
}

+ (void)test {
    NSLog(@"Person -------------- test");
}

@end
