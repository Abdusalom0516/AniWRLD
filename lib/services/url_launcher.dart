import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> urlLaunch(String link) async {
    final Uri url = Uri.parse(link);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
