

#import "Person+Test2.h"

@implementation Person (Test2)

+ (void)load {
    NSLog(@"Person Test2-------------- load");
}

+ (void)initialize {
    NSLog(@"Person Test2 -------------- initialize");
}

+ (void)test {
    NSLog(@"Person Test2-------------- test");
}
@end
