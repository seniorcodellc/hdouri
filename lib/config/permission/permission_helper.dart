import 'package:permission_handler/permission_handler.dart';
import 'package:cherubini/config/local_notification/local_notification.dart';
import 'package:cherubini/config/permission/permission_dialog.dart';

import '../../exports.dart';

PermissionManager permissionManager = ServiceLocator().getIt<PermissionManager>();
Future<bool> checkNotificationPermission(
  BuildContext context,
) async {
  permissionManager.setPermissionTypeAndContext(
    context: context,
    type: Permission.notification.value,
    dialog: PermissionDialog.Icon(
      title: AppStrings.notifications.trans,
      icon: Icons.notification_add,
      description: AppStrings.notificationPermission.trans,
    ),
  );
  bool isGranted = await permissionManager.getPermission();
  if (isGranted.isTrue) {
    isGranted = await NotificationsService().initialize();
  }
  return isGranted;
}

Future<bool> checkCameraPermission(
  BuildContext context,
) async {
  permissionManager.setPermissionTypeAndContext(
    context: context,
    type: Permission.camera.value,
    dialog: PermissionDialog.Icon(
      title: AppStrings.camera.trans,
      icon: Icons.camera_alt,
      description: AppStrings.cameraPermission.trans,
    ),
  );
  return await permissionManager.getPermission();
}

Future<bool> checkLocationPermission(
  BuildContext context,
) async {
  permissionManager.setPermissionTypeAndContext(
    context: context,
    type: Permission.location.value,
    dialog: PermissionDialog.Icon(
      title: AppStrings.location.trans,
      icon: Icons.location_on_rounded,
      description: AppStrings.locationPermission.trans,
    ),
  );
  return await permissionManager.getPermission();
}

Future<bool> checkLocationPermissionAndDoOperation(BuildContext context,
    {Function()? onSuccess, Function(String)? onFail}) async {
  bool isLocationEnabled = await checkLocationPermission(context);
  if (isLocationEnabled.isTrue) {
    onSuccess?.call();
  } else {
    onFail?.call(AppStrings.locationPermissionFailed.trans);
  }
  return isLocationEnabled;
}

Future<bool> checkNotificationPermissionAndDoOperation(BuildContext context,
    {Function()? onSuccess, Function(String)? onFail}) async {
  bool isNotificationEnabled = await checkNotificationPermission(context);
  if (isNotificationEnabled.isTrue) {
    onSuccess?.call();
  } else {
    onFail?.call(AppStrings.locationPermissionFailed.trans);
  }
  return isNotificationEnabled;
}

Future<bool> checkCameraPermissionAndDoOperation(BuildContext context, {Function()? onSuccess, Function(String)? onFail}) async {
  bool isCameraEnabled = await checkCameraPermission(context);
  print("isCameraEnabled $isCameraEnabled");
  if (isCameraEnabled.isTrue) {
    onSuccess?.call();
  } else {
    onFail?.call(AppStrings.locationPermissionFailed.trans);
  }
  return isCameraEnabled;
}
