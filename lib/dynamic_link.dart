import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLink {
  Future<String> createLink(String code) async {
    final String url = "https://com.example.cloudymlassignment?ref=$code";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
        androidParameters: const AndroidParameters(
            packageName: "com.example.cloudymlassignment", minimumVersion: 0),
        link: Uri.parse(url),
        uriPrefix: "https://cloudymlassignment.page.link");

    final FirebaseDynamicLinks link = await FirebaseDynamicLinks.instance;

    final refLink = await link.buildShortLink(parameters);

    return refLink.shortUrl.toString();
  }

  void initDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;
      Share.share("this is the link ${refLink.data}");
    }
  }
}
