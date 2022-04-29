import 'package:url_launcher/url_launcher.dart';

launchUrl(String url) async {
  try {
    await launch(url);
  } catch (e) {
    print(e);
  }
}
