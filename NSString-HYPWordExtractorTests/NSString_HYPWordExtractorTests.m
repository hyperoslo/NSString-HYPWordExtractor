//
//  NSString_HYPWordExtractorTests.m
//  NSString-HYPWordExtractorTests
//
//  Created by Christoffer Winterkvist on 13/10/14.
//
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "NSString+HYPWordExtractor.h"

@interface NSString_HYPWordExtractorTests : XCTestCase

@end

@implementation NSString_HYPWordExtractorTests

- (void)testWordCount {
    NSString *testString = @"first_name last_name";
    NSSet *words = [testString uniqueWords];

    XCTAssert(words.count == 2, @"Two words was found");
}

@end
