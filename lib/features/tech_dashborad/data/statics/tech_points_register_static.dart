import '../models/points_register_model.dart';
import '../../../../exports.dart';

class TechPointsRegisterStatic {
  static List<PointsRegisterModel> pointsRegisterList = [
    PointsRegisterModel(
      title: "مسح باركود - SC-001",
      date: "21\10\2025",
      points: "150+",
      asset: AppAssets.availablePoints,
      iconColor: AppColors.green,
      bgColor: AppColors.mutedGreen,
      pointsColor: AppColors.green,
    ),
    PointsRegisterModel(
      title: "مسح باركود - SC-002",
      date: "16\10\2025",
      points: "100+",
      asset: AppAssets.availablePoints,
      iconColor: AppColors.green,
      bgColor: AppColors.mutedGreen,
      pointsColor: AppColors.green,
    ),
    PointsRegisterModel(
      title: "استبدال خصم 10 %",
      date: "19\10\2025",
      points: "500-",
      asset: AppAssets.gift,
      iconColor: AppColors.primaryColor,
      bgColor: AppColors.mutedBlue,
      pointsColor: AppColors.red,
    ),
    PointsRegisterModel(
      title: "مسح باركود - SC-003",
      date: "18\10\2025",
      points: "250+",
      asset: AppAssets.availablePoints,
      iconColor: AppColors.green,
      bgColor: AppColors.mutedGreen,
      pointsColor: AppColors.green,
    ),
    PointsRegisterModel(
      title: "انتهاء صلاحية النقاط",
      date: "15\10\2025",
      points: "50-",
      asset: AppAssets.download,
      iconColor: AppColors.red,
      bgColor: AppColors.mutedRed,
      pointsColor: AppColors.red,
    ),
  ];
}
