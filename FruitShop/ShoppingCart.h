//
//  ShoppingCart.h
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import <Foundation/Foundation.h>

@class Fruit;

@interface ShoppingCart : NSObject

@property (strong, nonatomic, readonly) NSMutableArray<Fruit *> *items;

-(instancetype)initWithItemCodes: (NSArray<NSString *> *)itemCodes;
- (NSString *) checkout;

@end
