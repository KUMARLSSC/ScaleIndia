import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class Scorm extends StatelessWidget {
  Scorm({
    Key key,
  }) : super(key: key);
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  static const String selectedUrl = 'https://scalelms.azurewebsites.net/';
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: selectedUrl,
        javascriptChannels: jsChannels,
        mediaPlaybackRequiresUserGesture: false,
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorLoader3(
              radius: 20.0,
              dotRadius: 10.0,
            ),
            Text('Loading Please Wait....')
          ],
        )));
  }
}
