

#import "Person+Test1.h"

@implementation Person (Test1)

+ (void)load {
    NSLog(@"Person Test1-------------- load");
}

+ (void)initialize {
    NSLog(@"Person Test1 -------------- initialize");
}

+ (void)test {
    NSLog(@"Person Test1-------------- test");
}
@end
