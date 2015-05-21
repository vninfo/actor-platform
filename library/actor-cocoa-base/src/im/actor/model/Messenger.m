//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/Messenger.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/AuthState.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/CryptoProvider.h"
#include "im/actor/model/DispatcherProvider.h"
#include "im/actor/model/LogProvider.h"
#include "im/actor/model/MainThreadProvider.h"
#include "im/actor/model/Messenger.h"
#include "im/actor/model/ThreadingProvider.h"
#include "im/actor/model/concurrency/Command.h"
#include "im/actor/model/crypto/CryptoUtils.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Environment.h"
#include "im/actor/model/droidkit/engine/PreferencesStorage.h"
#include "im/actor/model/entity/FileReference.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/content/FastThumb.h"
#include "im/actor/model/files/FileSystemReference.h"
#include "im/actor/model/i18n/I18nEngine.h"
#include "im/actor/model/log/Log.h"
#include "im/actor/model/modules/Analytics.h"
#include "im/actor/model/modules/AppStateModule.h"
#include "im/actor/model/modules/Auth.h"
#include "im/actor/model/modules/Contacts.h"
#include "im/actor/model/modules/Files.h"
#include "im/actor/model/modules/Groups.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Notifications.h"
#include "im/actor/model/modules/Presence.h"
#include "im/actor/model/modules/Profile.h"
#include "im/actor/model/modules/Pushes.h"
#include "im/actor/model/modules/Security.h"
#include "im/actor/model/modules/Settings.h"
#include "im/actor/model/modules/Typing.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/Users.h"
#include "im/actor/model/mvvm/MVVMCollection.h"
#include "im/actor/model/mvvm/MVVMEngine.h"
#include "im/actor/model/mvvm/ValueModel.h"
#include "im/actor/model/network/ActorApi.h"
#include "im/actor/model/util/ActorTrace.h"
#include "im/actor/model/util/Timing.h"
#include "im/actor/model/viewmodel/AppStateVM.h"
#include "im/actor/model/viewmodel/FileCallback.h"
#include "im/actor/model/viewmodel/FileVM.h"
#include "im/actor/model/viewmodel/FileVMCallback.h"
#include "im/actor/model/viewmodel/GroupAvatarVM.h"
#include "im/actor/model/viewmodel/GroupTypingVM.h"
#include "im/actor/model/viewmodel/OwnAvatarVM.h"
#include "im/actor/model/viewmodel/UploadFileCallback.h"
#include "im/actor/model/viewmodel/UploadFileVM.h"
#include "im/actor/model/viewmodel/UploadFileVMCallback.h"
#include "im/actor/model/viewmodel/UserTypingVM.h"

@implementation AMMessenger

- (instancetype)initWithAMConfiguration:(AMConfiguration *)configuration {
  AMMessenger_initWithAMConfiguration_(self, configuration);
  return self;
}

- (AMAuthStateEnum *)getAuthState {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAuthModule])) getAuthState];
}

- (jboolean)isLoggedIn {
  return [self getAuthState] == AMAuthStateEnum_get_LOGGED_IN();
}

- (id<AMCommand>)requestSmsWithLong:(jlong)phone {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAuthModule])) requestSmsWithLong:phone];
}

- (id<AMCommand>)sendCodeWithInt:(jint)code {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAuthModule])) sendCodeWithInt:code];
}

- (id<AMCommand>)signUpWithNSString:(NSString *)name
                       withNSString:(NSString *)avatarPath
                        withBoolean:(jboolean)isSilent {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAuthModule])) signUpWithNSString:name withNSString:avatarPath withBoolean:isSilent];
}

- (jlong)getAuthPhone {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAuthModule])) getPhone];
}

- (void)resetAuth {
  [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAuthModule])) resetAuth];
}

- (void)onLoggedIn {
}

- (AMAppStateVM *)getAppState {
  return [((ImActorModelModulesAppStateModule *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAppStateModule])) getAppStateVM];
}

- (jint)myUid {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAuthModule])) myUid];
}

- (AMMVVMCollection *)getUsers {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getUsersModule] == nil) {
    return nil;
  }
  return [((ImActorModelModulesUsers *) nil_chk([modules_ getUsersModule])) getUsersCollection];
}

- (AMMVVMCollection *)getGroups {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule] == nil) {
    return nil;
  }
  return [((ImActorModelModulesGroups *) nil_chk([modules_ getGroupsModule])) getGroupsCollection];
}

- (AMValueModel *)getTypingWithInt:(jint)uid {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getTypingModule] == nil) {
    return nil;
  }
  return [((AMUserTypingVM *) nil_chk([((ImActorModelModulesTyping *) nil_chk([modules_ getTypingModule])) getTypingWithInt:uid])) getTyping];
}

- (AMValueModel *)getGroupTypingWithInt:(jint)gid {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getTypingModule] == nil) {
    return nil;
  }
  return [((AMGroupTypingVM *) nil_chk([((ImActorModelModulesTyping *) nil_chk([modules_ getTypingModule])) getGroupTypingWithInt:gid])) getActive];
}

- (AMOwnAvatarVM *)getOwnAvatarVM {
  return [((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getProfile])) getOwnAvatarVM];
}

- (AMGroupAvatarVM *)getGroupAvatarVMWithInt:(jint)gid {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) getAvatarVMWithInt:gid];
}

- (void)onAppVisible {
  [((ImActorModelModulesModules *) nil_chk(modules_)) onAppVisible];
}

- (void)onAppHidden {
  [((ImActorModelModulesModules *) nil_chk(modules_)) onAppHidden];
}

- (void)onDialogsOpen {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getNotifications] != nil) {
    [((ImActorModelModulesNotifications *) nil_chk([modules_ getNotifications])) onDialogsOpen];
  }
}

- (void)onDialogsClosed {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getNotifications] != nil) {
    [((ImActorModelModulesNotifications *) nil_chk([modules_ getNotifications])) onDialogsClosed];
  }
}

- (void)onConversationOpen:(AMPeer *)peer {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackChatOpenWithAMPeer:peer];
  if ([modules_ getPresenceModule] != nil) {
    [((ImActorModelModulesPresence *) nil_chk([modules_ getPresenceModule])) subscribeWithAMPeer:peer];
    [((ImActorModelModulesNotifications *) nil_chk([modules_ getNotifications])) onConversationOpenWithAMPeer:peer];
    [((ImActorModelModulesMessages *) nil_chk([modules_ getMessagesModule])) onConversationOpenWithAMPeer:peer];
  }
}

- (void)onConversationClosed:(AMPeer *)peer {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackChatClosedWithAMPeer:peer];
  if ([modules_ getPresenceModule] != nil) {
    [((ImActorModelModulesNotifications *) nil_chk([modules_ getNotifications])) onConversationCloseWithAMPeer:peer];
  }
}

- (void)onProfileOpen:(jint)uid {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackProfileOpenWithInt:uid];
  if ([modules_ getPresenceModule] != nil) {
    [((ImActorModelModulesPresence *) nil_chk([modules_ getPresenceModule])) subscribeWithAMPeer:AMPeer_userWithInt_(uid)];
  }
}

- (void)onProfileClosed:(jint)uid {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackProfileClosedWithInt:uid];
}

- (void)onTyping:(AMPeer *)peer {
  [((ImActorModelModulesTyping *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getTypingModule])) onTypingWithAMPeer:peer];
}

- (void)onPhoneBookChanged {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getContactsModule] != nil) {
    [((ImActorModelModulesContacts *) nil_chk([modules_ getContactsModule])) onPhoneBookChanged];
  }
}

- (void)onNetworkChanged {
  [((AMActorApi *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getActorApi])) onNetworkChanged];
}

- (void)onPushReceivedWithInt:(jint)seq {
  if ([((ImActorModelModulesModules *) nil_chk(modules_)) getUpdatesModule] != nil) {
    [((ImActorModelModulesUpdates *) nil_chk([modules_ getUpdatesModule])) onPushReceivedWithInt:seq];
  }
}

- (void)sendMessage:(AMPeer *)peer
           withText:(NSString *)text {
  [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) sendMessageWithAMPeer:peer withNSString:text];
}

- (void)sendPhotoWithAMPeer:(AMPeer *)peer
               withNSString:(NSString *)fileName
                    withInt:(jint)w
                    withInt:(jint)h
            withAMFastThumb:(AMFastThumb *)fastThumb
  withAMFileSystemReference:(id<AMFileSystemReference>)fileSystemReference {
  [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) sendPhotoWithAMPeer:peer withNSString:fileName withInt:w withInt:h withAMFastThumb:fastThumb withAMFileSystemReference:fileSystemReference];
}

- (void)sendVideoWithAMPeer:(AMPeer *)peer
               withNSString:(NSString *)fileName
                    withInt:(jint)w
                    withInt:(jint)h
                    withInt:(jint)duration
            withAMFastThumb:(AMFastThumb *)fastThumb
  withAMFileSystemReference:(id<AMFileSystemReference>)fileSystemReference {
  [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) sendVideoWithAMPeer:peer withNSString:fileName withInt:w withInt:h withInt:duration withAMFastThumb:fastThumb withAMFileSystemReference:fileSystemReference];
}

- (void)sendDocumentWithAMPeer:(AMPeer *)peer
                  withNSString:(NSString *)fileName
                  withNSString:(NSString *)mimeType
     withAMFileSystemReference:(id<AMFileSystemReference>)fileSystemReference {
  [self sendDocumentWithAMPeer:peer withNSString:fileName withNSString:mimeType withAMFileSystemReference:fileSystemReference withAMFastThumb:nil];
}

- (void)sendDocumentWithAMPeer:(AMPeer *)peer
                  withNSString:(NSString *)fileName
                  withNSString:(NSString *)mimeType
     withAMFileSystemReference:(id<AMFileSystemReference>)fileSystemReference
               withAMFastThumb:(AMFastThumb *)fastThumb {
  [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) sendDocumentWithAMPeer:peer withNSString:fileName withNSString:mimeType withAMFastThumb:fastThumb withAMFileSystemReference:fileSystemReference];
}

- (void)deleteMessagesWithAMPeer:(AMPeer *)peer
                   withLongArray:(IOSLongArray *)rids {
  [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) deleteMessagesWithAMPeer:peer withLongArray:rids];
}

- (id<AMCommand>)deleteChatWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) deleteChatWithAMPeer:peer];
}

- (id<AMCommand>)clearChatWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) clearChatWithAMPeer:peer];
}

- (void)saveDraft:(AMPeer *)peer
         withText:(NSString *)draft {
  [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) saveDraftWithAMPeer:peer withNSString:draft];
}

- (NSString *)loadDraft:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getMessagesModule])) loadDraftWithAMPeer:peer];
}

- (id<AMCommand>)editMyNameWithNSString:(NSString *)newName {
  return [((ImActorModelModulesUsers *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getUsersModule])) editMyNameWithNSString:newName];
}

- (void)changeAvatarWithNSString:(NSString *)descriptor {
  [((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getProfile])) changeAvatarWithNSString:descriptor];
}

- (void)removeAvatar {
  [((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getProfile])) removeAvatar];
}

- (id<AMCommand>)editNameWithInt:(jint)uid
                    withNSString:(NSString *)name {
  return [((ImActorModelModulesUsers *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getUsersModule])) editNameWithInt:uid withNSString:name];
}

- (id<AMCommand>)editGroupTitleWithInt:(jint)gid
                          withNSString:(NSString *)title {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) editTitleWithInt:gid withNSString:title];
}

- (void)changeGroupAvatarWithInt:(jint)gid
                    withNSString:(NSString *)descriptor {
  [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) changeAvatarWithInt:gid withNSString:descriptor];
}

- (void)removeGroupAvatarWithInt:(jint)gid {
  [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) removeAvatarWithInt:gid];
}

- (id<AMCommand>)createGroupWithNSString:(NSString *)title
                            withNSString:(NSString *)avatarDescriptor
                            withIntArray:(IOSIntArray *)uids {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) createGroupWithNSString:title withNSString:avatarDescriptor withIntArray:uids];
}

- (id<AMCommand>)leaveGroupWithInt:(jint)gid {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) leaveGroupWithInt:gid];
}

- (id<AMCommand>)addMemberToGroupWithInt:(jint)gid
                                 withInt:(jint)uid {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) addMemberToGroupWithInt:gid withInt:uid];
}

- (id<AMCommand>)kickMemberWithInt:(jint)gid
                           withInt:(jint)uid {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getGroupsModule])) kickMemberWithInt:gid withInt:uid];
}

- (id<AMCommand>)removeContactWithInt:(jint)uid {
  return [((ImActorModelModulesContacts *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getContactsModule])) removeContactWithInt:uid];
}

- (id<AMCommand>)addContactWithInt:(jint)uid {
  return [((ImActorModelModulesContacts *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getContactsModule])) addContactWithInt:uid];
}

- (id<AMCommand>)findUsersWithNSString:(NSString *)query {
  return [((ImActorModelModulesContacts *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getContactsModule])) findUsersWithNSString:query];
}

- (AMFileVM *)bindFileWithAMFileReference:(AMFileReference *)fileReference
                              withBoolean:(jboolean)isAutoStart
                     withAMFileVMCallback:(id<AMFileVMCallback>)callback {
  return new_AMFileVM_initWithAMFileReference_withBoolean_withImActorModelModulesModules_withAMFileVMCallback_(fileReference, isAutoStart, modules_, callback);
}

- (AMUploadFileVM *)bindUploadWithLong:(jlong)rid
            withAMUploadFileVMCallback:(id<AMUploadFileVMCallback>)callback {
  return new_AMUploadFileVM_initWithLong_withAMUploadFileVMCallback_withImActorModelModulesModules_(rid, callback, modules_);
}

- (void)bindRawFileWith:(AMFileReference *)fileReference
          withAutoStart:(jboolean)isAutoStart
           withCallback:(id<AMFileCallback>)callback {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) bindFileWithAMFileReference:fileReference withBoolean:isAutoStart withAMFileCallback:callback];
}

- (void)unbindRawFile:(jlong)fileId
       withAutoCancel:(jboolean)isAutoCancel
         withCallback:(id<AMFileCallback>)callback {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) unbindFileWithLong:fileId withAMFileCallback:callback withBoolean:isAutoCancel];
}

- (void)bindRawUploadFile:(jlong)rid
             withCallback:(id<AMUploadFileCallback>)callback {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) bindUploadFileWithLong:rid withAMUploadFileCallback:callback];
}

- (void)unbindRawUploadFile:(jlong)rid
               withCallback:(id<AMUploadFileCallback>)callback {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) unbindUploadFileWithLong:rid withAMUploadFileCallback:callback];
}

- (void)requestStateWithLong:(jlong)fileId
          withAMFileCallback:(id<AMFileCallback>)callback {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) requestStateWithLong:fileId withAMFileCallback:callback];
}

- (void)requestUploadStateWithLong:(jlong)rid
          withAMUploadFileCallback:(id<AMUploadFileCallback>)callback {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) requestUploadStateWithLong:rid withAMUploadFileCallback:callback];
}

- (void)cancelDownloadingWithLong:(jlong)fileId {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) cancelDownloadingWithLong:fileId];
}

- (void)startDownloadingWithAMFileReference:(AMFileReference *)location {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) startDownloadingWithAMFileReference:location];
}

- (void)resumeUploadWithLong:(jlong)rid {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) resumeUploadWithLong:rid];
}

- (void)pauseUploadWithLong:(jlong)rid {
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) pauseUploadWithLong:rid];
}

- (NSString *)getDownloadedDescriptorWithLong:(jlong)fileId {
  return [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) getDownloadedDescriptorWithLong:fileId];
}

- (jboolean)isConversationTonesEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isConversationTonesEnabled];
}

- (void)changeConversationTonesEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeConversationTonesEnabledWithBoolean:val];
}

- (jboolean)isNotificationsEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isNotificationsEnabled];
}

- (void)changeNotificationsEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeNotificationsEnabledWithBoolean:val];
}

- (jboolean)isNotificationSoundEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isNotificationSoundEnabled];
}

- (void)changeNotificationSoundEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeNotificationSoundEnabledWithBoolean:val];
}

- (NSString *)getNotificationSound {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) getNotificationSound];
}

- (void)changeNotificationSoundWithNSString:(NSString *)sound {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeNotificationSoundWithNSString:sound];
}

- (jboolean)isNotificationVibrationEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isVibrationEnabled];
}

- (void)changeNotificationVibrationEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeNotificationVibrationEnabledWithBoolean:val];
}

- (jboolean)isShowNotificationsText {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isShowNotificationsText];
}

- (void)changeShowNotificationTextEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeShowNotificationTextEnabledWithBoolean:val];
}

- (jboolean)isSendByEnterEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isSendByEnterEnabled];
}

- (void)changeSendByEnterWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeSendByEnterWithBoolean:val];
}

- (jboolean)isNotificationsEnabledWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isNotificationsEnabledWithAMPeer:peer];
}

- (void)changeNotificationsEnabledWithAMPeer:(AMPeer *)peer
                                 withBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeNotificationsEnabledWithAMPeer:peer withBoolean:val];
}

- (jboolean)isInAppNotificationsEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isInAppEnabled];
}

- (void)changeInAppNotificationsEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeInAppEnabledWithBoolean:val];
}

- (jboolean)isInAppNotificationSoundEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isInAppSoundEnabled];
}

- (void)changeInAppNotificationSoundEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeInAppSoundEnabledWithBoolean:val];
}

- (jboolean)isInAppNotificationVibrationEnabled {
  return [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) isInAppVibrationEnabled];
}

- (void)changeInAppNotificationVibrationEnabledWithBoolean:(jboolean)val {
  [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSettings])) changeInAppVibrationEnabledWithBoolean:val];
}

- (id<AMCommand>)loadSessions {
  return [((ImActorModelModulesSecurity *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSecurity])) loadSessions];
}

- (id<AMCommand>)terminateAllSessions {
  return [((ImActorModelModulesSecurity *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSecurity])) terminateAllSessions];
}

- (id<AMCommand>)terminateSessionWithInt:(jint)id_ {
  return [((ImActorModelModulesSecurity *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getSecurity])) terminateSessionWithInt:id_];
}

- (void)trackAuthPhoneOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthPhoneOpen];
}

- (void)trackAuthCountryOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCountryOpen];
}

- (void)trackAuthCountryClosed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCountryClosed];
}

- (void)trackAuthCountryPickedWithNSString:(NSString *)country {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCountryPickedWithNSString:country];
}

- (void)trackAuthPhoneTypeWithNSString:(NSString *)newValue {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthPhoneTypeWithNSString:newValue];
}

- (void)trackAuthPhoneInfoOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthPhoneInfoOpen];
}

- (void)trackCodeRequest {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackCodeRequest];
}

- (void)trackAuthCodeTypeWithNSString:(NSString *)newValue {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCodeTypeWithNSString:newValue];
}

- (void)trackBackPressed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackBackPressed];
}

- (void)trackUpPressed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackUpPressed];
}

- (void)trackAuthCodeWrongNumber {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCodeWrongNumber];
}

- (void)trackAuthCodeWrongNumberCancel {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCodeWrongNumberCancel];
}

- (void)trackAuthCodeWrongNumberChange {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCodeWrongNumberChange];
}

- (void)trackAuthCodeOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCodeOpen];
}

- (void)trackAuthCodeClosed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthCodeClosed];
}

- (void)trackAuthSignupOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSignupOpen];
}

- (void)trackAuthSignupClosed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSignupClosed];
}

- (void)trackAuthSignupClosedNameTypeWithNSString:(NSString *)newValue {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSignupClosedNameTypeWithNSString:newValue];
}

- (void)trackAuthSignupPressedAvatar {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSignupPressedAvatar];
}

- (void)trackAuthSignupAvatarPicked {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSignupAvatarPicked];
}

- (void)trackAuthSignupAvatarDeleted {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSignupAvatarDeleted];
}

- (void)trackAuthSignupAvatarCanelled {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSignupAvatarCanelled];
}

- (void)trackAuthSuccess {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackAuthSuccess];
}

- (void)trackDialogsOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackDialogsOpen];
}

- (void)trackDialogsClosed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackDialogsClosed];
}

- (void)trackContactsOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackContactsOpen];
}

- (void)trackContactsClosed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackContactsClosed];
}

- (void)trackMainScreensOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackMainScreensOpen];
}

- (void)trackMainScreensClosed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackMainScreensClosed];
}

- (void)trackOwnProfileOpen {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackOwnProfileOpen];
}

- (void)trackOwnProfileClosed {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackOwnProfileClosed];
}

- (void)trackTextSendWithAMPeer:(AMPeer *)peer {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackTextSendWithAMPeer:peer];
}

- (void)trackPhotoSendWithAMPeer:(AMPeer *)peer {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackPhotoSendWithAMPeer:peer];
}

- (void)trackVideoSendWithAMPeer:(AMPeer *)peer {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackVideoSendWithAMPeer:peer];
}

- (void)trackDocumentSendWithAMPeer:(AMPeer *)peer {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackDocumentSendWithAMPeer:peer];
}

- (void)trackActionErrorWithNSString:(NSString *)action
                        withNSString:(NSString *)tag
                        withNSString:(NSString *)message {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackActionErrorWithNSString:action withNSString:tag withNSString:message];
}

- (void)trackActionSuccessWithNSString:(NSString *)action {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackActionSuccessWithNSString:action];
}

- (void)trackActionTryAgainWithNSString:(NSString *)action {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackActionTryAgainWithNSString:action];
}

- (void)trackActionCancelWithNSString:(NSString *)action {
  [((ImActorModelModulesAnalytics *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getAnalytics])) trackActionCancelWithNSString:action];
}

- (AMI18nEngine *)getFormatter {
  return [((ImActorModelModulesModules *) nil_chk(modules_)) getI18nEngine];
}

- (void)registerGooglePushWithLong:(jlong)projectId
                      withNSString:(NSString *)token {
  [((ImActorModelModulesPushes *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getPushes])) registerGooglePushWithLong:projectId withNSString:token];
}

- (void)registerApplePushWithInt:(jint)apnsId
                    withNSString:(NSString *)token {
  [((ImActorModelModulesPushes *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getPushes])) registerApplePushWithInt:apnsId withNSString:token];
}

- (id<DKPreferencesStorage>)getPreferences {
  return [((ImActorModelModulesModules *) nil_chk(modules_)) getPreferences];
}

@end

void AMMessenger_initWithAMConfiguration_(AMMessenger *self, AMConfiguration *configuration) {
  (void) NSObject_init(self);
  AMLog_setLogWithAMLogProvider_([((AMConfiguration *) nil_chk(configuration)) getLog]);
  DKEnvironment_setThreadingProviderWithAMThreadingProvider_([configuration getThreadingProvider]);
  DKEnvironment_setDispatcherProviderWithAMDispatcherProvider_([configuration getDispatcherProvider]);
  AMTiming *timing = new_AMTiming_initWithNSString_(@"MESSENGER_INIT");
  [timing sectionWithNSString:@"Crypto"];
  AMCryptoUtils_init__WithAMCryptoProvider_([configuration getCryptoProvider]);
  [timing sectionWithNSString:@"MVVM"];
  AMMVVMEngine_init__WithAMMainThreadProvider_([configuration getMainThreadProvider]);
  [timing sectionWithNSString:@"Actors"];
  [((DKActorSystem *) nil_chk(DKActorSystem_system())) setTraceInterfaceWithDKTraceInterface:new_AMActorTrace_init()];
  if (![((id<AMMainThreadProvider>) nil_chk([configuration getMainThreadProvider])) isSingleThread]) {
    [((DKActorSystem *) nil_chk(DKActorSystem_system())) addDispatcherWithNSString:@"db" withInt:1];
  }
  [timing sectionWithNSString:@"Modules:Create"];
  self->modules_ = new_ImActorModelModulesModules_initWithAMMessenger_withAMConfiguration_(self, configuration);
  [timing sectionWithNSString:@"Modules:Run"];
  [self->modules_ run];
  [timing end];
}

AMMessenger *new_AMMessenger_initWithAMConfiguration_(AMConfiguration *configuration) {
  AMMessenger *self = [AMMessenger alloc];
  AMMessenger_initWithAMConfiguration_(self, configuration);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMMessenger)
