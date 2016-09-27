//
//  NSDictionary+ForNSNull.h
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ForNSNull)
- (id)objectForKeySafely:(id)aKey;
@end

@interface NSMutableDictionary (SafeValue)

- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
