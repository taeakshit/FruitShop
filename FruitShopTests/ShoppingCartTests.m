//
//  ShoppingCartTests.m
//  FruitShopTests
//
//  Created by Developer on 30/04/18.
//

#import <XCTest/XCTest.h>
#import "ShoppingCart.h"
#import "Fruit.h"

@interface ShoppingCartTests : XCTestCase

@end

@implementation ShoppingCartTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCartInitialization {
    
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Orange", @"Apple", @"Apple" ]];
    
    Fruit *item1 = cart.items[0];
    Fruit *item2 = cart.items[1];
    Fruit *item3 = cart.items[2];
    Fruit *item4 = cart.items[3];
    
    XCTAssertEqual(item1.type, FruitTypeApple);
    XCTAssertEqual(item2.type, FruitTypeOrange);
    XCTAssertEqual(item3.type, FruitTypeApple);
    XCTAssertEqual(item4.type, FruitTypeApple);
}

- (void) testFruitPrices {
    
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Orange", @"Apple", @"Apple" ]];
    
    Fruit *item1 = cart.items[0];
    Fruit *item2 = cart.items[1];
    Fruit *item3 = cart.items[2];
    Fruit *item4 = cart.items[3];

    XCTAssertEqual(item1.price, 0.60);
    XCTAssertEqual(item2.price, 0.25);
    XCTAssertEqual(item3.price, 0.6);
    XCTAssertEqual(item4.price, 0.600);
}

- (void) testCheckoutForAllApples {
    
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"apple", @"Apple", @"Apple" ]];
    NSString *totalPrice = [cart checkout];
    XCTAssertEqualObjects(totalPrice, @"£2.4");
}

- (void) testCheckoutForAllOranges {
    
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"orange", @"Orange", @"orange", @"orange" ]];
    NSString *totalPrice = [cart checkout];
    XCTAssertEqualObjects(totalPrice, @"£1");
}

- (void) testCheckoutForMixedFruits {
    
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Apple", @"orange", @"Orange", @"orange", @"orange" ]];
    NSString *totalPrice = [cart checkout];
    XCTAssertEqualObjects(totalPrice, @"£2.2");
}

- (void) testDiscountWithAppleOffer {
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Apple", @"orange", @"Orange", @"orange", @"orange" ]];
    double discountedPrice = [cart getDiscountedPriceForOffer:SpecialOffer1FreeOn1Apple items:cart.items];
    XCTAssertEqual(discountedPrice, 0.6);
}

- (void) testDiscountWithOrangeOffer {
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Apple", @"orange", @"Orange", @"orange", @"orange" ]];
    double discountedPrice = [cart getDiscountedPriceForOffer:SpecialOffer3For2Oranges items:cart.items];
    XCTAssertEqual(discountedPrice, 0.25);
}

- (void) testCheckoutWithAppleOffer {
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Apple", @"orange", @"Orange", @"orange", @"orange" ]];
    [cart applyOffer:SpecialOffer1FreeOn1Apple];
    NSString *totalPrice = [cart checkout];
    XCTAssertEqualObjects(totalPrice, @"£1.6");
}

- (void) testCheckoutWithOrangeOffer {
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Apple", @"orange", @"Orange", @"orange", @"orange" ]];
    [cart applyOffer:SpecialOffer3For2Oranges];
    NSString *totalPrice = [cart checkout];
    XCTAssertEqualObjects(totalPrice, @"£1.95");
}

- (void) testCheckoutWithNoOffer {
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItemCodes:@[ @"Apple", @"Apple", @"orange", @"Orange", @"orange", @"orange" ]];
//    [cart applyOffer:SpecialOfferNotApplied];
    NSString *totalPrice = [cart checkout];
    XCTAssertEqualObjects(totalPrice, @"£2.2");
}


@end
