//
//  SBCipher.h
//  Pods
//
//  Created by Semyon Belokovsky on 29/06/2017.
//
//

#import <Foundation/Foundation.h>

@interface SBCipher : NSObject 

+ (NSString *)xorData:(NSData *)d1 d2:(NSData *)d2;
+ (NSString *)xorString:(NSString *)s1 s2:(NSString *)s2;
+ (NSString *)hexSha512:(NSString *)string isHex:(BOOL)isHex;

@end
