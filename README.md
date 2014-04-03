Intro
=======

This NSString extension has been created as a simple replacement for **RegexKitLite** library using the **NSRegularExpression** class from Foundation.

At this initital stage, this extension only covers the most common and used functions of **RegexKitLite**.

The idea behind this project is replace the **RegexKitLite** library without the necessity to change your source code written using the **RegexKitLite** (Only the #import should be replaced).

Current implemented functions
=============================
```objc
- (BOOL)isMatchedByRegex:(NSString *)regex;
- (BOOL)isMatchedByRegex:(NSString *)regex inRange:(NSRange)range;

- (NSString *)stringByMatching:(NSString *)regex;
- (NSString *)stringByMatching:(NSString *)regex capture:(NSInteger)capture;
- (NSString *)stringByMatching:(NSString *)regex inRange:(NSRange)range;
- (NSString *)stringByMatching:(NSString *)regex capture:(NSInteger)capture inRange:(NSRange)range;

- (NSArray *)componentsMatchedByRegex:(NSString *)regex;
- (NSArray *)componentsMatchedByRegex:(NSString *)regex capture:(NSInteger)capture;
- (NSArray *)componentsMatchedByRegex:(NSString *)regex inRange:(NSRange)range;
- (NSArray *)componentsMatchedByRegex:(NSString *)regex capture:(NSInteger)capture inRange:(NSRange)range;
```

External libraries
==================

No external libraries are required.
