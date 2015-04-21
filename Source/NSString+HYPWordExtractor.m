#import "NSString+HYPWordExtractor.h"

@implementation NSString (HYPWordExtractor)

- (NSArray *)hyp_words
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFGHIJKOLMNOPQRSTUVWXYZÅÄÆÖØabcdefghijkolmnopqrstuvwxyzåäæöø_"];

    return [self hyp_parseWords:[NSMutableArray new] withCharacterSet:set];
}

- (NSSet *)hyp_uniqueWords
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFGHIJKOLMNOPQRSTUVWXYZÅÄÆÖØabcdefghijkolmnopqrstuvwxyzåäæöø_"];

    return [self hyp_parseWords:[NSMutableSet new] withCharacterSet:set];
}

- (NSArray *)hyp_variables
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKOLMNOPQRSTUVWXYZÅÄÆÖØabcdefghijkolmnopqrstuvwxyzåäæöø_[.]0123456789"];

    return [self cleanupNumericVariables:[self hyp_parseWords:[NSMutableArray new]
                                             withCharacterSet:characterSet]];
}

- (NSSet *)hyp_uniqueVariables
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKOLMNOPQRSTUVWXYZÅÄÆÖØabcdefghijkolmnopqrstuvwxyzåäæöø_[.]0123456789"];

    NSMutableSet *mutableSet = [NSMutableSet new];

    [mutableSet addObjectsFromArray:[self cleanupNumericVariables:[self hyp_parseWords:[NSMutableSet new]
                                                               withCharacterSet:characterSet]]];

    return [mutableSet copy];
}

#pragma mark - Private methods

- (id)hyp_parseWords:(id)container withCharacterSet:(NSCharacterSet *)set
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSString *word;

    while (!scanner.isAtEnd) {
        if ([scanner scanCharactersFromSet:set intoString:&word]) {
            [container addObject:word];
        }

        if (scanner.scanLocation < self.length)
            scanner.scanLocation++;
    }

    return [container copy];
}

- (NSArray *)cleanupNumericVariables:(NSArray *)array {
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:array, nil];

    for (NSString *variable in array) {
        if ([[variable stringByTrimmingCharactersInSet:characterSet] isEqualToString:@""]) {
            [mutableArray removeObject:variable];
        }
    }

    return [mutableArray copy];
}

@end
