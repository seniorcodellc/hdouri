

import '../../../../exports.dart';
import '../repo/setting_repo.dart';

class SettingsUseCase {
  final SettingsRepo settingRepo;
  SettingsUseCase({required this.settingRepo});
  Future<Either<Failure,ResponseModel>> getSettings() => settingRepo.getSettings();
}