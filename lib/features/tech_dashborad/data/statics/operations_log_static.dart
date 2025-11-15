import 'package:hdouri/features/tech_dashborad/data/models/operations_log_model.dart';

class OperationsLogStatic {
  static List<OperationsLogModel> operationsLogList = [
    OperationsLogModel(
      title: 'SC-001',
      date: '14:30  -21/10/2025',
      points: '150',
      prodNum: '3',
      prodNames: ["ثلاجة سامسونج 20 قدم", "غسالة LG 8 كيلو", "مكيف جري 2 طن"],
      prodCodes: ["SN 123456", "SN 123456", "SN 123456"],
    ),
    OperationsLogModel(
      title: 'SC-001',
      date: '14:30  -21/10/2025',
      points: '100',
      prodNum: '2',
      prodNames: ["تلفزيون سوني 55 بوصة", "ميكرويف باناسونيك"],
      prodCodes: ["SN 123456", "SN 123456"],
    ),
  ];
}
