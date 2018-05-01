//
//  ShoppingCart.h
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SpecialOfferNotApplied,
    SpecialOffer1FreeOn1Apple,
    SpecialOffer3For2Oranges,
} SpecialOffer;

@class Fruit;

@interface ShoppingCart : NSObject

@property (strong, nonatomic, readonly) NSMutableArray<Fruit *> *items;

-(instancetype)initWithItemCodes: (NSArray<NSString *> *)itemCodes;
- (void) applyOffer: (SpecialOffer)offer;
- (NSString *) checkout;
- (double) getDiscountedPriceForOffer: (SpecialOffer)offer items:(NSArray<Fruit *>*)items;

@end
