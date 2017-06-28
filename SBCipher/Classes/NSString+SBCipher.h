//
//  NSString+SBCipher.h
//  Pods
//
//  Created by Semyon Belokovsky on 29/06/2017.
//
//

#import <Foundation/Foundation.h>

@interface NSString (SBCipher)

- (NSData *)hexToBytes;
+ (NSString *)toHexString:(unsigned char*)data length:(unsigned int)length;
- (NSString *)toHexString;

@end
