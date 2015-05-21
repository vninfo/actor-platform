//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/updates/UsersProcessor.java
//


#include "J2ObjC_source.h"
#include "im/actor/model/api/Avatar.h"
#include "im/actor/model/api/User.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/engine/KeyValueEngine.h"
#include "im/actor/model/entity/Avatar.h"
#include "im/actor/model/entity/User.h"
#include "im/actor/model/modules/BaseModule.h"
#include "im/actor/model/modules/Contacts.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/contacts/ContactsSyncActor.h"
#include "im/actor/model/modules/messages/DialogsActor.h"
#include "im/actor/model/modules/updates/UsersProcessor.h"
#include "im/actor/model/util/JavaUtil.h"
#include "java/lang/Integer.h"
#include "java/util/ArrayList.h"
#include "java/util/Collection.h"

@interface ImActorModelModulesUpdatesUsersProcessor ()

- (void)onUserDescChangedWithAMUser:(AMUser *)u;

@end

__attribute__((unused)) static void ImActorModelModulesUpdatesUsersProcessor_onUserDescChangedWithAMUser_(ImActorModelModulesUpdatesUsersProcessor *self, AMUser *u);

@implementation ImActorModelModulesUpdatesUsersProcessor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  ImActorModelModulesUpdatesUsersProcessor_initWithImActorModelModulesModules_(self, messenger);
  return self;
}

- (void)applyUsersWithJavaUtilCollection:(id<JavaUtilCollection>)updated
                             withBoolean:(jboolean)forced {
  JavaUtilArrayList *batch = new_JavaUtilArrayList_init();
  for (ImActorModelApiUser * __strong u in nil_chk(updated)) {
    AMUser *saved = [((id<DKKeyValueEngine>) nil_chk([self users])) getValueWithLong:[((ImActorModelApiUser *) nil_chk(u)) getId]];
    if (saved == nil) {
      [batch addWithId:new_AMUser_initWithImActorModelApiUser_(u)];
    }
    else if (forced) {
      AMUser *upd = new_AMUser_initWithImActorModelApiUser_(u);
      [batch addWithId:upd];
      if (![((NSString *) nil_chk([upd getName])) isEqual:[saved getName]] || !AMJavaUtil_equalsEWithId_withId_([upd getAvatar], [saved getAvatar])) {
        ImActorModelModulesUpdatesUsersProcessor_onUserDescChangedWithAMUser_(self, upd);
      }
    }
  }
  if ([batch size] > 0) {
    [((id<DKKeyValueEngine>) nil_chk([self users])) addOrUpdateItemsWithJavaUtilList:batch];
  }
}

- (void)onUserNameChangedWithInt:(jint)uid
                    withNSString:(NSString *)name {
  AMUser *u = [((id<DKKeyValueEngine>) nil_chk([self users])) getValueWithLong:uid];
  if (u != nil) {
    if ([((NSString *) nil_chk([u getServerName])) isEqual:name]) {
      return;
    }
    u = [u editNameWithNSString:name];
    [((id<DKKeyValueEngine>) nil_chk([self users])) addOrUpdateItemWithDKKeyValueItem:u];
    if ([((AMUser *) nil_chk(u)) getLocalName] == nil) {
      ImActorModelModulesUpdatesUsersProcessor_onUserDescChangedWithAMUser_(self, u);
    }
  }
}

- (void)onUserLocalNameChangedWithInt:(jint)uid
                         withNSString:(NSString *)name {
  AMUser *u = [((id<DKKeyValueEngine>) nil_chk([self users])) getValueWithLong:uid];
  if (u != nil) {
    if (AMJavaUtil_equalsEWithId_withId_([u getLocalName], name)) {
      return;
    }
    u = [u editLocalNameWithNSString:name];
    [((id<DKKeyValueEngine>) nil_chk([self users])) addOrUpdateItemWithDKKeyValueItem:u];
    ImActorModelModulesUpdatesUsersProcessor_onUserDescChangedWithAMUser_(self, u);
  }
}

- (void)onUserAvatarChangedWithInt:(jint)uid
         withImActorModelApiAvatar:(ImActorModelApiAvatar *)avatar {
  AMUser *u = [((id<DKKeyValueEngine>) nil_chk([self users])) getValueWithLong:uid];
  if (u != nil) {
    u = [u editAvatarWithImActorModelApiAvatar:avatar];
    [((id<DKKeyValueEngine>) nil_chk([self users])) addOrUpdateItemWithDKKeyValueItem:u];
    ImActorModelModulesUpdatesUsersProcessor_onUserDescChangedWithAMUser_(self, u);
  }
}

- (jboolean)hasUsersWithJavaUtilCollection:(id<JavaUtilCollection>)uids {
  for (JavaLangInteger * __strong uid in nil_chk(uids)) {
    if ([((id<DKKeyValueEngine>) nil_chk([self users])) getValueWithLong:[((JavaLangInteger *) nil_chk(uid)) intValue]] == nil) {
      return NO;
    }
  }
  return YES;
}

- (void)onUserDescChangedWithAMUser:(AMUser *)u {
  ImActorModelModulesUpdatesUsersProcessor_onUserDescChangedWithAMUser_(self, u);
}

@end

void ImActorModelModulesUpdatesUsersProcessor_initWithImActorModelModulesModules_(ImActorModelModulesUpdatesUsersProcessor *self, ImActorModelModulesModules *messenger) {
  (void) ImActorModelModulesBaseModule_initWithImActorModelModulesModules_(self, messenger);
}

ImActorModelModulesUpdatesUsersProcessor *new_ImActorModelModulesUpdatesUsersProcessor_initWithImActorModelModulesModules_(ImActorModelModulesModules *messenger) {
  ImActorModelModulesUpdatesUsersProcessor *self = [ImActorModelModulesUpdatesUsersProcessor alloc];
  ImActorModelModulesUpdatesUsersProcessor_initWithImActorModelModulesModules_(self, messenger);
  return self;
}

void ImActorModelModulesUpdatesUsersProcessor_onUserDescChangedWithAMUser_(ImActorModelModulesUpdatesUsersProcessor *self, AMUser *u) {
  [((DKActorRef *) nil_chk([((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsActor])) sendWithId:new_ImActorModelModulesMessagesDialogsActor_UserChanged_initWithAMUser_(u)];
  [((DKActorRef *) nil_chk([((ImActorModelModulesContacts *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getContactsModule])) getContactSyncActor])) sendWithId:new_ImActorModelModulesContactsContactsSyncActor_UserChanged_initWithAMUser_(u)];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesUsersProcessor)
