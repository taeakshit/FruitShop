//
//  Fruit.h
//  FruitShop
//
//  Created by Developer on 30/04/18.
//

#import <Foundation/Foundation.h>

@interface Fruit : NSObject

@property (nonatomic, readwrite) double price;

-(instancetype)initWithCode: (NSString *)code;

@end
