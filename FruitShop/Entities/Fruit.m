//
//  Fruit.m
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import "Fruit.h"

typedef enum : NSUInteger {
    FruitTypeApple,
    FruitTypeOrange,
} FruitType;

@interface Fruit ()

@property (nonatomic, readwrite) FruitType type;

@end

@implementation Fruit

-(instancetype)initWithCode: (NSString *)code {
    self = [super init];
    if (self) {
        if ([code.lowercaseString isEqualToString:@"apple"]) {
            self.type = FruitTypeApple;
        } else if ([code.lowercaseString isEqualToString:@"apple"]) {
            self.type = FruitTypeOrange;
        } else {
            NSAssert(false, @"Invalid item");
        }
    }
    return self;
}

@end
