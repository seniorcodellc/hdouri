import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cherubini/config/local_notification/local_notification.dart';
import 'package:cherubini/config/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service_locator.dart';

class FirebaseService {
  /// Private constructor
  FirebaseService._internal();
  static final FirebaseService _instance = FirebaseService._internal();

  /// Factory method that reuse same instance automatically
  factory FirebaseService() => _instance;

  get init {
    FirebaseMessaging.onBackgroundMessage(handleFirebaseBackground); /*  on background */
    FirebaseMessaging.onMessage.listen(handleFirebaseForeground); /* on foreground*/
    FirebaseMessaging.onMessageOpenedApp.listen(handleFirebaseOnAppOpenedActionBased); /* on foreground*/
  }

  ///create object from class
  SharedPreferences preferences = ServiceLocator().getIt<SharedPreferences>();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getDeviceToken() async {
    /* login and  verification */
    String? fcmToken;
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission();
    }
    fcmToken = await firebaseMessaging.getToken();

    log(fcmToken.toString());
    return fcmToken;
  }
}

Future<void> handleFirebaseForeground(RemoteMessage message) async {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print("title = ${message.notification?.title}");
    print("notification = ${message.notification}");
    print("body = ${message.notification?.body}");
    print("data = ${message.data}");
    NotificationsService().showSimpleNotification(
        title: message.notification!.title.validate,
        description: message.notification!.body.validate,
        payload: message.data.fromJsonToString);
    if (message.data["type"] == "chat") {
      // getBlocData<ChatCubit>().getMessageFromFirebase(fromFirebase: message.data);
    } else {
      // getBlocData<OrderCubit>().getOrder();
      // AppService()
      //     .getBlocData<BottomSheetOperationCubit>()
      //     .changeBottomSheet(3);
    }
  }
}

Future<void> handleFirebaseBackground(RemoteMessage message) async {
  // print('Got a message whilst in the background!');
  // print('Message data: ${message.data}');
  // if (message.notification != null) {
  //   print("title = ${message.notification?.title}");
  //   print("title = ${message.notification?.body}");
  //   print("title = ${message.data}");
  //   Notifications.showSimpleNotification(
  //       title: message.notification?.title,
  //       description: message.notification?.body,
  //       payload: message.data.fromJsonToString);
  //   // AppService()
  //   //     .getBlocData<GetDriverCubit>()
  //   //     .getDriver(id: int.parse(message.data['order_id']));

  // }
  print("title = ${message.notification?.title}");
  print("notification = ${message.notification}");
  print("body = ${message.notification?.body}");
  print("data = ${message.data}");
  NotificationsService().showSimpleNotification(
      title: message.notification!.title.validate,
      description: message.notification!.body.validate,
      payload: message.data.fromJsonToString);
  if (message.data["type"] == "chat") {
    // getBlocData<ChatCubit>().getMessageFromFirebase(fromFirebase: message.data);
  } else {
    // getBlocData<OrderCubit>().getOrder();
    // AppService()
    //     .getBlocData<BottomSheetOperationCubit>()
    //     .changeBottomSheet(3);
  }
}

Future handleFirebaseOnAppOpenedActionBased(RemoteMessage message) async {
  print("title = ${message.notification?.title}");
  print("notification = ${message.notification}");
  print("body = ${message.notification?.body}");
  print("data = ${message.data}");
  NotificationsService().showSimpleNotification(
      title: message.notification!.title.validate,
      description: message.notification!.body.validate,
      payload: message.data.fromJsonToString);
  if (message.data["type"] == "chat") {
    // getBlocData<ChatCubit>().getMessageFromFirebase(fromFirebase: message.data);
  } else {
    // getBlocData<OrderCubit>().getOrder();
    // AppService()
    //     .getBlocData<BottomSheetOperationCubit>()
    //     .changeBottomSheet(3);
  }
/*  if (message.notification != null) {
    print("title = ${message.notification?.title}");
    print("body = ${message.notification?.body}");
    print("data = ${message.data}");
    NotificationService().showSimpleNotification(
        title: message.notification?.title, description: message.notification?.body, payload: message.data.fromJsonToString);
    */ /* Routes.bottomNavigationRoute.moveTo();
    getBlocData<OrderCubit>().getOrderDetails(orderId: message.data["order_id"].toString().toInt);
*/ /*
  }*/
}
