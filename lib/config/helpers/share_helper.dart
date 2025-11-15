import 'package:share_plus/share_plus.dart';

class ShareHelper {
   static Future<void> shareLink(String url) async {
    try {
      await SharePlus.instance.share(ShareParams(
        text: url,));
      print(url);
    } catch (e) {
      print('خطأ أثناء المشاركة: $e');
    }
  }
}
