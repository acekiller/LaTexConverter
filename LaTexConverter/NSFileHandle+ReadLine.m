//
//  NSFileHandle+ReadLine.m
//  LaTexConverter
//
//  Created by Samuel von Bausznern on 15.07.13.
//  Copyright (c) 2013 Samuel von Bausznern. All rights reserved.
//

#import "NSFileHandle+ReadLine.h"
#import "NSData+Additions.h"

@implementation NSFileHandle (ReadLine)

- (NSString*) readLine {
    NSString* _lineDelimiter = @"\n";
    
    NSData* newLineData = [_lineDelimiter dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* currentData = [NSMutableData new];
    
    bool shouldReadMore = true;
    
    NSUInteger _chunkSize = 16;
    
    while (shouldReadMore) {
        NSData* chunk = [self readDataOfLength:_chunkSize];
        
        if ([chunk length] == 0) {
            break;
        }
        
        NSRange newLineRange = [chunk rangeOfData:newLineData];
        
        if (newLineRange.location != NSNotFound) {
            [self seekToFileOffset:[self offsetInFile] - [chunk length] + newLineRange.location + [newLineData length]];
            chunk = [chunk subdataWithRange:
                     NSMakeRange(0, newLineRange.location + [newLineData length])];
            shouldReadMore = false;
        }
        
        [currentData appendData:chunk];
    }
    
    return [[NSString alloc] initWithData:currentData encoding:NSUTF8StringEncoding];
}

- (void) enumerateLinesUsingBlock:(void (^)(NSString *, bool *))block {
    NSString* line = nil;
    bool stop = false;
    
    while (stop == false && (line = [self readLine])) {
        block(line, &stop);
    }
}

@end
