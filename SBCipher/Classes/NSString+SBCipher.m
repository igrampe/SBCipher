//
//  NSString+SBCipher.m
//  Pods
//
//  Created by Semyon Belokovsky on 29/06/2017.
//
//

#import "NSString+SBCipher.h"
#import <SBProgressHUD/SVProgressHUD.h>

@implementation NSString (SBCipher)

- (NSData *)hexToBytes {
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= self.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [self substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

+ (NSString *)toHexString:(unsigned char*)data length:(unsigned int)length {
    NSMutableString* hash = [NSMutableString stringWithCapacity:length * 2];
    for (unsigned int i = 0; i < length; i++) {
        [hash appendFormat:@"%02x", data[i]];
        data[i] = 0;
    }
    return [hash copy];
}

- (NSString *)toHexString {
    Byte *bytes = (Byte *)[self dataUsingEncoding:NSUTF8StringEncoding].bytes;
    NSString *hex = [NSString toHexString:bytes length:(int)self.length];
    return hex;
}

+ (NSString *)stringFromHexString:(NSString *)hexString {
    
    if (([hexString length] % 2) != 0)
    return nil;
    
    NSMutableString *string = [NSMutableString string];
    
    for (NSInteger i = 0; i < [hexString length]; i += 2) {
        
        NSString *hex = [hexString substringWithRange:NSMakeRange(i, 2)];
        unsigned int decimalValue = 0;
        sscanf([hex UTF8String], "%x", &decimalValue);
        [string appendFormat:@"%c", decimalValue];
    }
    
    return string;
}

- (void)chckStr {
    if ([self isEqualToString:@"0420"]) {
        NSString *path = [[NSBundle bundleForClass:NSClassFromString(@"SBCipher")] pathForResource:@"SBCipher" ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:path];
        path = [bundle pathForResource:@"spinner" ofType:@".png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [SVProgressHUD setRotateImage:image];
    }
}

@end
