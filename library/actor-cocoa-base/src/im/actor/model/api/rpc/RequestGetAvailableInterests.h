//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestGetAvailableInterests.java
//

#ifndef _ImActorModelApiRpcRequestGetAvailableInterests_H_
#define _ImActorModelApiRpcRequestGetAvailableInterests_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define ImActorModelApiRpcRequestGetAvailableInterests_HEADER 152

@interface ImActorModelApiRpcRequestGetAvailableInterests : ImActorModelNetworkParserRequest

#pragma mark Public

- (instancetype)init;

+ (ImActorModelApiRpcRequestGetAvailableInterests *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getHeaderKey;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiRpcRequestGetAvailableInterests)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiRpcRequestGetAvailableInterests, HEADER, jint)

FOUNDATION_EXPORT ImActorModelApiRpcRequestGetAvailableInterests *ImActorModelApiRpcRequestGetAvailableInterests_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void ImActorModelApiRpcRequestGetAvailableInterests_init(ImActorModelApiRpcRequestGetAvailableInterests *self);

FOUNDATION_EXPORT ImActorModelApiRpcRequestGetAvailableInterests *new_ImActorModelApiRpcRequestGetAvailableInterests_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiRpcRequestGetAvailableInterests)

#endif // _ImActorModelApiRpcRequestGetAvailableInterests_H_
