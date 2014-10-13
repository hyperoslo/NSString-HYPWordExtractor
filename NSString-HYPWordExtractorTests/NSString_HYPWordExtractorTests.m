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

- (void)testUniqueWordCount {
    NSString *testString = @"firstName last_name";
    NSSet *words = [testString hyp_uniqueWords];

    XCTAssert(words.count == 2, @"Two words was found");
}

- (void)testWordCount {
    NSString *testString = @"firstName last_name, last_name";
    NSArray *words = [testString hyp_words];

    XCTAssert(words.count == 3, @"Two words was found");
}

@end
