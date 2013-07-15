//
//  NSData+Additions.m
//  LaTexConverter
//
//  Created by Samuel von Bausznern on 15.07.13.
//  Copyright (c) 2013 Samuel von Bausznern. All rights reserved.
//

#import "NSData+Additions.h"

@implementation NSData (Additions)

- (NSRange)rangeOfData:(NSData *)dataToFind {
    const void* bytes = [self bytes];
    NSUInteger length = [self length];
    
    const void* searchBytes = [dataToFind bytes];
    NSUInteger searchLength = [dataToFind length];
    NSUInteger searchIndex = 0;
    
    NSRange foundRange = {NSNotFound, searchLength};
    
    for (NSUInteger i = 0; i < length; ++i) {
        if (((char*)bytes)[i] == ((char*)searchBytes)[searchIndex]) {
            // Current character matches.
            if (foundRange.location == NSNotFound) {
                foundRange.location = i;
            }
            
            ++searchIndex;
            
            if (searchIndex >= searchLength) {
                return foundRange;
            }
        } else {
            // Match doesn't continue
            searchIndex = 0;
            foundRange.location = NSNotFound;
        }
    }
    
    return foundRange;
}

@end
