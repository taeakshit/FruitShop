//
//  ShoppingCart.m
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import "ShoppingCart.h"
#import "Fruit.h"

@interface ShoppingCart()

@property (strong, nonatomic) NSMutableArray<Fruit *> *items;

@property (readwrite, nonatomic) SpecialOffer offer;

@end

@implementation ShoppingCart

-(instancetype)initWithItemCodes: (NSArray<NSString *> *)itemCodes {
    self = [super init];
    if (self) {
        self.items = @[].mutableCopy;
        for (NSString *code in itemCodes) {
            Fruit *fruit = [[Fruit alloc] initWithCode:code];
            [self.items addObject:fruit];
        }
    }
    return self;
}

- (void) applyOffer: (SpecialOffer)offer {
    self.offer = offer;
}

- (NSString *)checkout {
    double totalPrice = 0;
    for (Fruit *fruit in self.items) {
        totalPrice += fruit.price;
    }
    
    if (self.offer != SpecialOfferNotApplied) {
        double discount = [self getDiscountedPriceForOffer:self.offer items:self.items];
        totalPrice -= discount;
    }
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setCurrencyCode:@"GBP"];
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:0];
    [formatter setUsesGroupingSeparator:NO];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    return [formatter stringFromNumber:[NSNumber numberWithDouble:totalPrice]];
}

- (double) getDiscountedPriceForOffer: (SpecialOffer)offer items:(NSArray<Fruit *>*)items {
    
    int appleCount = 0;
    int orangeCount = 0;
    
    for (Fruit *fruit in items) {
        switch (fruit.type) {
            case FruitTypeApple:
                appleCount += 1;
                break;
            case FruitTypeOrange:
                orangeCount += 1;
                break;
        }
    }
    
    int freeApplesCount = 0;
    int freeOrangesCount = 0;
    
    switch (offer) {
        case SpecialOffer1FreeOn1Apple:
            if (appleCount > 1) {
                freeApplesCount = appleCount / 2;
            }
            return [Fruit getApplePrice] * freeApplesCount;
            break;
            
        case SpecialOffer3For2Oranges:
            if (orangeCount > 1) {
                freeOrangesCount = orangeCount / 3;
            }
            return [Fruit getOrangePrice] * freeOrangesCount;
            break;
    }
    return 0;
}

@end
