//
//  MSNetworksManager.h
//  WiFiTest
//
//  Created by 李志康 on 15/9/30.
//  Copyright (c) 2015年 李志康. All rights reserved.
//

// 在ios扫描公共区域内wifi信息中，写了实现wifi扫描的一种方法，但是那种方法扫描出来的wifi信息不全，下面是扫描全部wifi信息的实现方法：

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/NSTimer.h>
#import <Foundation/Foundation.h>
#include <dlfcn.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
@interface MSNetworksManager : NSObject {
    
    NSMutableDictionary *networks;
    NSArray *types;
    int autoScanInterval;
    bool scanning;
    bool autoScanning;
    void *libHandle;
    void *airportHandle;
    
    int (*open)(void *);
    int (*bind)(void *, NSString *);
    int (*close)(void *);
    int (*associate)(void *, NSDictionary*, NSString*);
    int (*scan)(void *, NSArray **, void *);
    
    //int (*open)(void *);
    //int (*bind)(void *, NSString *);
    //int (*close)(void *);
    //int (*scan)(void *, NSArray **, void *);
    //int (*associate)(void*, NSDictionary *, NSString *);
    int (*getpower)(void *, char *);
    int (*setpower)(void*, char*);
}
+ (MSNetworksManager *)sharedNetworksManager;
+ (NSNumber *)numberFromBSSID:(NSString *) bssid;
- (NSMutableDictionary *)networks;
- (NSDictionary *)networks:(int) type;
- (NSDictionary *)network:(NSString *) aNetwork;
- (id)init;
- (void)dealloc;
- (NSInteger)numberOfNetworks;
- (NSInteger)numberOfNetworks:(int) type;
- (NSInteger)autoScanInterval;
- (void)scan;
- (void)removeNetwork:(NSString *)aNetwork;
- (void)removeAllNetworks;
- (void)removeAllNetworks:(int) type;
- (void)autoScan:(bool)scan;
- (bool)autoScan;
- (void)scanSelector:(id)param;
- (void)setAutoScanInterval:(int) scanInterval;
- (int)associateNetwork: (NSDictionary *)bss password: (NSString *)password;
- (int)getPower: (char *)power;
- (int)setPower: (char *)power;
- (NSString *) localIPAddress;

@end




