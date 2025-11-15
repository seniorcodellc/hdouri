
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

import '../../exports.dart';

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();
final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

class NotificationsService {
  NotificationsService._internal();
  static final NotificationsService _instance = NotificationsService._internal();
  factory NotificationsService() => _instance;
  //  LocalNotifications._internal();
  //static LocalNotification instance=;
  //factory getInstance=>LocalNotification();
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<bool> initialize() async {
    bool isPermissionGrated = await _requestPermissions();
    bool isInitialized = false;
    if (isPermissionGrated.isTrue) {
      InitializationSettings initSettings;
      if (Platform.isAndroid) {
        AndroidInitializationSettings androidSettings = const AndroidInitializationSettings('app_icon');
        initSettings = InitializationSettings(
          android: androidSettings,
        );
      } else {
        //platform is ios
        DarwinInitializationSettings iOSSettings = DarwinInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
          // onDidReceiveLocalNotification: (id, title, body, payload) {
          //   didReceiveLocalNotificationSubject.add(ReceivedNotification(id: id, title: title!, body: body!, payload: payload!));
          // },
        );
        initSettings = InitializationSettings(iOS: iOSSettings);
      }
      _flutterLocalNotificationsPlugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      );
      isInitialized = (await _flutterLocalNotificationsPlugin.initialize(initSettings)).orFalse;
    } else {
      print("permission is not granted for notification");
    }
    return isInitialized;
  }

  Future<void> showBigPictureNotification(
      {required String title, required String description, String? contentTitle, String? summaryText, String? payload}) async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
      const DrawableResourceAndroidBitmap("cover_image"),
      largeIcon: const DrawableResourceAndroidBitmap("app_icon"),
      contentTitle: contentTitle,
      summaryText: summaryText,
    );
    NotificationDetails platformDetails =
        NotificationDetails(android: _getAndroidDetails(styleInformation: bigPictureStyleInformation), iOS: null);
    await _flutterLocalNotificationsPlugin.show(0, title, description, platformDetails, payload: payload);
  }

  Future<void> showBigTextNotification(
      {required String title,
      required String description,
      required String bigText,
      String? contentTitle,
      String? summaryText,
      String? payload}) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(bigText,
        htmlFormatBigText: true,
        contentTitle: contentTitle,
        htmlFormatContentTitle: true,
        summaryText: summaryText,
        htmlFormatSummaryText: true);
    NotificationDetails notificationDetails =
        NotificationDetails(android: _getAndroidDetails(styleInformation: bigTextStyleInformation), iOS: null);
    await _flutterLocalNotificationsPlugin.show(0, title, description, notificationDetails, payload: payload);
  }

  Future<void> showScheduleNotification(
      {required title, required description, String? payload, required RepeatInterval scheduledNotificationDateTime}) async {
    var platformDetails = NotificationDetails(android: _getAndroidDetails(), iOS: _getIOSDetails());
    await _flutterLocalNotificationsPlugin.periodicallyShow(0, title, description, scheduledNotificationDateTime, platformDetails,
        payload: payload, androidScheduleMode: AndroidScheduleMode.alarmClock);
  }

  AndroidNotificationDetails _getAndroidDetails({StyleInformation? styleInformation}) => AndroidNotificationDetails(
        'id',
        'channel ',
        channelDescription: 'description',
        priority: Priority.high,
        color: AppColors.white,
        colorized: true,
        importance: Importance.max,
        largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
        playSound: true,
        enableVibration: true,
        styleInformation: styleInformation,
      );
  DarwinNotificationDetails _getIOSDetails() => DarwinNotificationDetails();

  Future<void> showOngoingNotification() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel_id', 'Channel Name',
        channelDescription: 'Channel Description',
        importance: Importance.max,
        priority: Priority.high,
        icon: 'app_icon',
        ongoing: true,
        autoCancel: false);

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
        0, 'Flutter Local Notification', 'Flutter Ongoing Notification', notificationDetails,
        payload: 'Destination Screen(Ongoing Notification)');
  }

  Future<bool> _requestPermissions() async {
    if (Platform.isAndroid) {
      bool? isPermissionAndroidGranted = (await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission())
          .orFalse;
      return isPermissionAndroidGranted.orFalse;
    } else {
      bool? isPermissionIosGranted = (await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ))
          .orFalse;
      return isPermissionIosGranted.orFalse;
    }
  }

  @pragma('vm:entry-point')
  static notificationTapBackground(NotificationResponse notificationResponse) {
    // handle action
    debugPrint("pressed");
/*    Navigator.of(getContext).push(MaterialPageRoute(builder: (_) {
      return DestinationScreen(
        payload: notificationResponse.payload!,
      );
    }));*/
  }

  static onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
    // handle action
    debugPrint("pressed"); // ...
    debugPrint("presseddddddddd");
/*    Navigator.of(getContext).push(MaterialPageRoute(builder: (_) {
      return DestinationScreen(
        payload: notificationResponse.payload!,
      );
    }));*/
  }

  showSimpleNotification({required title, required description, String? payload}) async {
    NotificationDetails platformDetails = NotificationDetails(
      android: _getAndroidDetails(),
      iOS: _getIOSDetails(),
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      description,
      platformDetails,
      payload: payload,
    );
  }
}
