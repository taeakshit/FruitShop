//
//  ShoppingCart.h
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import <Foundation/Foundation.h>

@class Fruit;

@interface ShoppingCart : NSObject

@property (strong, nonatomic) NSArray<Fruit *> *items;

-(instancetype)initWithItems: (NSArray<NSString *> *)items;
- (double) checkout;

@end
