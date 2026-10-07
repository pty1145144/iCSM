#pragma once
#import <Foundation/Foundation.h>

static NSString *const ICSMPlayerNamePreference = @"icsm.playerName";
// Source public/const.h: MAX_PLAYER_NAME_LENGTH is 128, including the NUL.
static inline NSString *ICSMValidatedPlayerName(NSString *value) {
    if (![value isKindOfClass:NSString.class]) return nil;
    NSString *name = [[value stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] precomposedStringWithCanonicalMapping];
    if (!name.length || [name lengthOfBytesUsingEncoding:NSUTF8StringEncoding] >= 128) return nil;
    NSMutableCharacterSet *forbidden = [NSCharacterSet.controlCharacterSet mutableCopy];
    [forbidden addCharactersInString:@"\"\\;"];
    return [name rangeOfCharacterFromSet:forbidden].location == NSNotFound ? name : nil;
}
