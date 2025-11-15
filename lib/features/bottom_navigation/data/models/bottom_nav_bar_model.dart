import '../../../../exports.dart';

class BottomNavBarModel {
  final String asset;
  final String tabName;
  final String? appBatTitle;
  final Color? systemBarColor;
  BottomNavBarModel({
    required this.asset,
    required this.tabName,
    this.appBatTitle,
    this.systemBarColor,
  });
}
