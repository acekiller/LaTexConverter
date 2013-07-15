//
//  NSFileHandle+ReadLine.h
//  LaTexConverter
//
//  Created by Samuel von Bausznern on 15.07.13.
//  Copyright (c) 2013 Samuel von Bausznern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileHandle (ReadLine)

- (NSString*) readLine;

- (void) enumerateLinesUsingBlock:(void(^)(NSString*, bool*))block;

//TODO: Add <NSFastEnumeration> conformance.

@end
