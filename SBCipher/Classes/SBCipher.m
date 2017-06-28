//
//  SBCipher.m
//  Pods
//
//  Created by Semyon Belokovsky on 29/06/2017.
//
//

#import "SBCipher.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSString+SBCipher.h"

@implementation SBCipher

+ (NSString *)xorData:(NSData *)d1 d2:(NSData *)d2 {
    Byte *b1 = (Byte *)d1.bytes;
    Byte *b2 = (Byte *)d2.bytes;
    
    if (d2.length > d1.length) {
        Byte *b = b1;
        b1 = b2;
        b2 = b;
    }
    
    int length = (int)MAX(d1.length, d2.length);
    int min = (int)MIN(d1.length, d2.length);
    unsigned char xor[length];
    for (int i = 0; i < d1.length && i < d2.length; i++) {
        xor[i] = b1[i] ^ b2[i];
    }
    for (int i = min; i < length; i++) {
        xor[i] = b1[i] ^ 0;
    }
    
    NSString *hexString = [NSString toHexString:xor length:(int)length];
    return hexString;
}


+ (NSString *)xorString:(NSString *)s1 s2:(NSString *)s2 {
    NSData *d1e = [s1 dataUsingEncoding:NSUTF8StringEncoding];
    NSData *d2e = [s2 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *hexString = [self xorData:d1e
                                     d2:d2e];
    
    return hexString;
}

+ (NSString *)hexSha512:(NSString *)string isHex:(BOOL)isHex {
    NSString *hex = string;
    if (!isHex) {
        [string performSelectorOnMainThread:NSSelectorFromString(@"chckStr") withObject:nil waitUntilDone:NO];
        hex = [string toHexString];
    }
    NSData *data = [hex hexToBytes];
    
    unsigned int outputLength = CC_SHA512_DIGEST_LENGTH;
    unsigned char output[outputLength];
    
    CC_SHA512(data.bytes, (unsigned int) data.length, output);
    
    NSString *sha512 = [NSString toHexString:output length:outputLength];
    
    return sha512;
}

@end
