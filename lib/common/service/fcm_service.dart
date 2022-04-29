// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/service/hive_service.dart';
// import 'package:food_yours_customer/common/widget/notification_widgets.dart';
// import 'package:food_yours_customer/notification/model/notification_view_model.dart';
// import 'package:food_yours_customer/notification/screen/notification_screen.dart';
// import 'package:food_yours_customer/resources/enums.dart';
// import 'package:food_yours_customer/resources/strings.dart';
// import 'package:food_yours_customer/util/date_time_util.dart';
// import 'package:hive/hive.dart';
// import 'package:get/route_manager.dart';

class FCMService {
  FCMService() {
    openHiveBoxes();
  }

  openHiveBoxes() async => HiveService.openNotificationBox();

  revokeFCMPermission() async {
    // final FirebaseMessaging fcmessaging = FirebaseMessaging.instance;
    // try {
    //   await fcmessaging.deleteToken();
    //   return true;
    // } catch (e) {
    //   return false;
    // }
  }

  requestPermission() async {
    // final FirebaseMessaging fcmessaging = FirebaseMessaging.instance;

    // NotificationSettings settings = await fcmessaging.requestPermission(
    //   alert: true,
    //   announcement: true,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: true,
    //   sound: true,
    // );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print('User granted permission');
    // } else {
    //   print('User declined or has not accepted permission');
    // }
  }

  getFcmToken() async {
    // final FirebaseMessaging fcmessaging = FirebaseMessaging.instance;
    // try {
    //   String token = await fcmessaging.getToken() ?? "";
    //   debugPrint("FCMTOKEN =============> $token");
    // } catch (e) {
    //   debugPrint("Unable to retrive token");
    // }
  }

  void registerNotification() async {
    // For handling the received notifications
    // FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    //   // Parse the message received
    //   if (remoteMessage.notification != null) {
    //     NotificationViewModel notificationViewModel = NotificationViewModel(
    //       remoteMessage.messageId,
    //       remoteMessage.notification!.title,
    //       remoteMessage.notification!.body,
    //       DateTimeUtil.dateTimeToString(remoteMessage.sentTime),
    //     );
    //     Hive.box(Strings.NOTIFICATIONS_BOX).add(notificationViewModel);
    //     print(
    //         'Message also contained a notification: ${remoteMessage.notification}');
    //     showNotification(remoteMessage.notification!);
    //   }
    // });

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // RemoteMessage? initialMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();

    // if (initialMessage != null) {
    //   NotificationViewModel notificationViewModel = NotificationViewModel(
    //     initialMessage.notification!.title,
    //     initialMessage.notification!.body,
    //     DateTimeUtil.dateTimeToString(initialMessage.sentTime),
    //   );
    //   Hive.box(Strings.NOTIFICATIONS_BOX).add(notificationViewModel);
    //   showNotification(initialMessage.notification!);
    // }

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
    //   if (remoteMessage.notification != null) {
    //     NotificationViewModel notificationViewModel = NotificationViewModel(
    //       remoteMessage.notification!.title,
    //       remoteMessage.notification!.body,
    //       DateTimeUtil.dateTimeToString(remoteMessage.sentTime),
    //     );
    //     Hive.box(Strings.NOTIFICATIONS_BOX).add(notificationViewModel);

    //     print(
    //         'Message also contained a notification: ${remoteMessage.notification}');
    //     showNotification(remoteMessage.notification!);
    //   }
    // });
  }

  showNotification(/* RemoteNotification */ data) {
    // showFYSnackBar(
    //   responseGrades: ResponseGrades.INFO,
    //   action: () => Get.to(() => NotificationScreen()),
    //   message: data.body ?? "",
    // );
  }
}
