//
//  Fruit.m
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import "Fruit.h"

@interface Fruit ()

@property (nonatomic, readwrite) FruitType type;

@end

@implementation Fruit

-(instancetype)initWithCode: (NSString *)code {
    self = [super init];
    if (self) {
        if ([self isFruitApple:code]) {
            [self initApple];
        } else if ([self isFruitOrange:code]) {
            [self initOrange];
        } else {
            NSAssert(false, @"Invalid Fruit type");
        }
    }
    return self;
}

- (BOOL) isFruitApple: (NSString *)code {
    return [code.lowercaseString isEqualToString:@"apple"];
}

- (BOOL) isFruitOrange: (NSString *)code {
    return [code.lowercaseString isEqualToString:@"orange"];
}

- (void) initApple {
    self.type = FruitTypeApple;
    self.price = [Fruit getApplePrice];
}

- (void) initOrange {
    self.type = FruitTypeOrange;
    self.price = [Fruit getOrangePrice];
}

+ (double) getApplePrice {
    return 0.6;
}

+ (double) getOrangePrice {
    return 0.25;
}

@end
