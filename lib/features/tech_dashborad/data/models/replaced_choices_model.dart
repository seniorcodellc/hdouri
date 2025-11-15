class ReplacedChoicesModel {
  ReplacedChoicesModel({
    required this.subTitle,
    required this.title,
    this.notAvailable,
  });
  final String title;
  final String subTitle;
  String? notAvailable;
}
