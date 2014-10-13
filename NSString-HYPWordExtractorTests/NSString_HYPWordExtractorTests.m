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

- (void)testUniqueWordContainerContents
{
    NSString *testString = @"firstName last_name";
    NSSet *words = [testString hyp_uniqueWords];
    BOOL valid = YES;

    if (![words containsObject:@"firstName"]) {
        valid = NO;
    }

    if (![words containsObject:@"last_name"]) {
        valid = NO;
    }

    XCTAssert(valid, @"Container both contain firstName & last_name");
}

- (void)testWordContainerContents
{
    NSString *testString = @"firstName last_name, last_name";
    NSArray *words = [testString hyp_words];
    BOOL valid = YES;

    if (![words.firstObject isEqualToString:@"firstName"]) {
        valid = NO;
    }

    if (![words[1] isEqualToString:@"last_name"] || ![words.lastObject isEqualToString:@"last_name"]) {
        valid = NO;
    }

    XCTAssert(valid, @"Container contain all three words in testString");
}

@end
