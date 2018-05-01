//
//  ShoppingCartTests.m
//  FruitShopTests
//
//  Created by Developer on 30/04/18.
//

#import <XCTest/XCTest.h>
#import "ShoppingCart.h"

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
    
    ShoppingCart *cart = [[ShoppingCart alloc] initWithItems:@[ @"Apple", @"Orange", @"Apple", @"Apple" ]];
    
    Fruit *item1 = cart.items[0];
    Fruit *item2 = cart.items[1];
    Fruit *item3 = cart.items[2];
    Fruit *item4 = cart.items[3];
    
    
}

@end
