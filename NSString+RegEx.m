//
//  NSString+RegEx.m
//  NSRegEx (https://github.com/xEsk/NSRegEx)
//
//  Created by Xesc on 03/04/14.
//
//  The MIT License (MIT)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "NSString+RegEx.h"

#define NSRegEx(regex) [[NSRegularExpression alloc] initWithPattern:regex options:0 error:nil]

@implementation NSString (RegEx)

- (BOOL)isMatchedByRegex:(NSString *)regex
{
	return [self isMatchedByRegex:regex inRange:NSMakeRange(0, self.length)];
}

- (BOOL)isMatchedByRegex:(NSString *)regex inRange:(NSRange)range
{
	return [NSRegEx(regex) numberOfMatchesInString:self options:0 range:range] > 0;
}

- (NSString *)stringByMatching:(NSString *)regex
{
	return [self stringByMatching:regex capture:0L];
}

- (NSString *)stringByMatching:(NSString *)regex capture:(NSInteger)capture
{
	return [self stringByMatching:regex capture:capture inRange:NSMakeRange(0, self.length)];
}

- (NSString *)stringByMatching:(NSString *)regex inRange:(NSRange)range
{
	return [self stringByMatching:regex capture:0L inRange:range];
}

- (NSString *)stringByMatching:(NSString *)regex capture:(NSInteger)capture inRange:(NSRange)range
{
	NSTextCheckingResult *match = [NSRegEx(regex) firstMatchInString:self options:0 range:range];
	return match && capture < match.numberOfRanges ? [self substringWithRange:[match rangeAtIndex:capture]] : nil;
}

- (NSArray *)componentsMatchedByRegex:(NSString *)regex
{
	return [self componentsMatchedByRegex:regex capture:0L];
}

- (NSArray *)componentsMatchedByRegex:(NSString *)regex capture:(NSInteger)capture
{
	return [self componentsMatchedByRegex:regex capture:capture inRange:NSMakeRange(0, self.length)];
}

- (NSArray *)componentsMatchedByRegex:(NSString *)regex inRange:(NSRange)range
{
	return [self componentsMatchedByRegex:regex capture:0L inRange:range];
}

- (NSArray *)componentsMatchedByRegex:(NSString *)regex capture:(NSInteger)capture inRange:(NSRange)range
{
	// get locations of matches
	NSMutableArray *matchingRanges = [NSMutableArray array];
	NSArray *matches = [NSRegEx(regex) matchesInString:self options:0 range:range];
	for (NSTextCheckingResult *match in matches)
	{
		if (capture < match.numberOfRanges)
		{
			[matchingRanges addObject:[NSValue valueWithRange:[match rangeAtIndex:capture]]];
		}
	}
	// use split ranges to select pieces
	NSMutableArray *pieces = [NSMutableArray array];
	for (NSValue *value in matchingRanges)
	{
		[pieces addObject:[self substringWithRange:value.rangeValue]];
	}
	return pieces;
}

@end
