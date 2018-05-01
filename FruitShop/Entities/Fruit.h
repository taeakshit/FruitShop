//
//  Fruit.h
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    FruitTypeApple,
    FruitTypeOrange,
} FruitType;

@interface Fruit : NSObject

@property (nonatomic, readwrite) double price;
@property (nonatomic, readonly) FruitType type;

-(instancetype)initWithCode: (NSString *)code;

@end
