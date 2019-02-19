

#import "Student+Test1.h"

@implementation Student (Test1)

+ (void)load {
    NSLog(@"Student Test1-------------- load");
}

+ (void)initialize {
    NSLog(@"Student Test1 -------------- initialize");
}

+ (void)test {
    NSLog(@"Student Test1-------------- test");
}
@end
