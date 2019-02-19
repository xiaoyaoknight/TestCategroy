

#import "Student.h"

@implementation Student

+ (void)load {
    NSLog(@"Student -------------- load");
}

+ (void)initialize {
    NSLog(@"Student -------------- initialize");
}


+ (void)test {
    NSLog(@"Student -------------- test");
}
@end
