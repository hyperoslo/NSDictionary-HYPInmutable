@import UIKit;
@import XCTest;

#import "NSDictionary+HYPImmutable.h"

@interface PodTests : XCTestCase

@end

@implementation PodTests

- (void)testDictionaryByRemovingNullItems
{
    NSDictionary *dictionary = @{@"first_name" : @"Domenica",
                                 @"last_name" : [NSNull null]};

    XCTAssertEqualObjects([dictionary hyp_dictionaryByRemovingNullItems], @{@"first_name" : @"Domenica"});
}

- (void)testDictionaryBySettingObject
{
    NSDictionary *dictionary = @{@"first_name" : @"Domenica"};

    NSDictionary *result = [dictionary hyp_dictionaryBySettingObject:@"Emma" forKey:@"first_name"];
    XCTAssertEqualObjects(result, @{@"first_name" : @"Emma"});

    result = [dictionary hyp_dictionaryBySettingObject:@"Karlson" forKey:@"last_name"];
    NSDictionary *expected =  @{@"first_name" : @"Domenica",
                                @"last_name"  : @"Karlson"};
    XCTAssertEqualObjects(result, expected);

}

- (void)testDictionaryByRemovingKey
{
    NSDictionary *dictionary = @{@"first_name" : @"Domenica",
                                 @"last_name"  : @"Karlson"};

    NSDictionary *result = [dictionary hyp_dictionaryByRemovingKey:@"last_name"];
    XCTAssertEqualObjects(result, @{@"first_name" : @"Domenica"});
}

- (void)testAdd1
{
    NSDictionary *dictionary = @{@"first_name" : @"Domenica"};

    NSDictionary *result = [dictionary hyp_dictionaryByAppendingDictionary:@{@"last_name"  : @"Karlson"}];
    NSDictionary *expected =  @{@"first_name" : @"Domenica",
                                @"last_name"  : @"Karlson"};
    XCTAssertEqualObjects(result, expected);
}


@end
