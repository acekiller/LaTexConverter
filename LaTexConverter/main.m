//
//  main.m
//  LaTexConverter
//
//  Created by Samuel von Bausznern on 15.07.13.
//  Copyright (c) 2013 Samuel von Bausznern. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSFileHandle+ReadLine.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString* file_path = @"/Users/muma/Documents/Studium/UZH/2. Semester FS13/Neurobiologie/Hormone und Neurotransmitter/Hormone und Neurotransmitter.tex";
        
        NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:file_path];
        
        
        NSString* line = nil;
        
        while ((line = [fileHandle readLine])) {
            NSLog(line);
        }
    }
    return 0;
}

