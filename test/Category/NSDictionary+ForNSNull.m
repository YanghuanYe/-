//
//  NSDictionary+ForNSNull.m
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "NSDictionary+ForNSNull.h"

@implementation NSDictionary (ForNSNull)
//处理json含有null的情况
- (id)objectForKeySafely:(id)aKey
{
    if (self == nil || self == (id)[NSNull null]) {
        NSLog(@"NSDictionary warning:NSDictionary为nil");
        return nil;
    }
    id value = [self objectForKey:aKey];
    if (value == nil || value == (id)[NSNull null]) {
        if (value == (id)[NSNull null])
            NSLog(@"NSDictionary warning:(key=%@,value=NSNull", aKey);
            return nil;
        } else
            return value;
}
@end

@implementation NSMutableDictionary (SafeValue)

- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (aKey) {
        if (!anObject) {
            [self setObject:[NSNull null] forKey:aKey];
        } else {
            [self setObject:anObject forKey:aKey];
        }
    }
}

@end
