

#import "ViewController.h"
#import "Person.h"
#import "Person+Test1.h"
#import "Person+Test2.h"
#import <objc/runtime.h>
#import "Cat.h"
#import "Dog.h"
#import "Student.h"
#import "Student+Test1.h"
#import "Student+Test2.h"
#import "Animal.h"
#import "Animal+Run.h"
#import "Animal+Eat.h"
#import "Animal+bite.h"

@interface ViewController ()

@end

@implementation ViewController


/*
 分类底层结构 查看Person+Test1.cpp文件
 
 typedef struct category_t {
 const char *name;
 classref_t cls;
 struct method_list_t *instanceMethods;
 struct method_list_t *classMethods;
 struct protocol_list_t *protocols;
 struct property_list_t *instanceProperties;
 } category_t;
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"---------测试load方法Class和Category加载顺序-------------");
    /*
     类的load方法调用早于Category中的load方法,
     调用子类的load方法之前, 会先调用父类的load方法
     没有关系的类会根据编译顺序调用load方法,
     Category会根据编译顺序调用load方法
     所有的类和分类, load方法只会调用一次
     load方法可以继承, 但是一般情况下不会主动调用load方法, 都是让系统自动调用
     */
    [Person load];
    [Person test];
    
    NSLog(@"---------测试initialize方法Class和Category加载顺序-------------");
    /*
     通过源码可以看到,
     +initialize方法会在类第一次接收到消息时调用 使用的是objc_msgSend消息机制调用
     先调用父类的+initialize，再调用子类的+initialize
     (先初始化父类，再初始化子类，每个类只会初始化1次)
     */
    
    //    [Person alloc];
    
    // 如果子类没有实现+initialize，会调用父类的+initialize（所以父类的+initialize可能会被调用多次）
    // 如果分类实现了+initialize，就覆盖类本身的+initialize调用
    // (student中去掉initialize进行打印，初始化的时候发现父类没有初始化，之后才会初始化子类，可能调用2次initialize，后面打印其实是student)
    [Student alloc];
    
    NSLog(@"---------测试多继承-------------");
    [Cat run];
    [Dog eat];
    
    NSLog(@"---------测试私有方法-------------");
    // Animal中有bite私有方法，并没有对外暴露，如果直接调用会报错
    // 使用Animal+bite 分类，暴露bite方法，就可以正确调用了
    [Animal bite];
}

@end
