
#import "Student+Test2.h"

@implementation Student (Test2)

+ (void)load {
    NSLog(@"Student Test2------------- load");
}

//+ (void)initialize {
//    NSLog(@"Student Test2 -------------- initialize");
//}

+ (void)test {
    NSLog(@"Student Test2------------- test");
}
@end
