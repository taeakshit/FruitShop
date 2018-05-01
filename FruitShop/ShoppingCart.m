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


- (NSString *)checkout {
    double totalPrice = 0;
    for (Fruit *fruit in self.items) {
        totalPrice += fruit.price;
    }
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setCurrencyCode:@"GBP"];
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:0];
    [formatter setUsesGroupingSeparator:NO];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    return [formatter stringFromNumber:[NSNumber numberWithDouble:totalPrice]];
}

@end
