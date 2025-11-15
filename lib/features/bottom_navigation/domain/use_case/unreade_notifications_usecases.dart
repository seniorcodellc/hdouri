

import '../../../../exports.dart';
import '../repo/unread_notifications_repo.dart';

class UnReadNotificationsUseCase {
  UnReadNotificationsRepo unReadNotificationsRepo;

  UnReadNotificationsUseCase({required this.unReadNotificationsRepo});
  Future<Either<Failure, ResponseModel>> getUnReadNotifications() => unReadNotificationsRepo.getUnReadNotifications();
  Future<Either<Failure, ResponseModel>> readNotifications() => unReadNotificationsRepo.readNotifications();
}
