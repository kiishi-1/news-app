import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  Webview({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<Webview> createState() => _WebviewState();
}
class _WebviewState extends State<Webview> {

  late WebViewController _webViewController;
  double _webViewProgress = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          //everytime we click on the phone back button we enter this onWillPop function
          if (await _webViewController.canGoBack()) {
            _webViewController.goBack();

            // to make sure we stay in app after clicking the back button on the phone
            return false;
          } else {
            // to leave
            return true;
            //so if we can no longer go back in our WebView, we use to to exit the application i.e true

            //to always stay in the application
            //return false;
          }
        },
        child: Scaffold(
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.grey[800],
            actions: [
              IconButton(
                  onPressed: () => _webViewController.reload(),
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ))
            ],
          ),
          body: Column(
            children: [
              LinearProgressIndicator(
                value: _webViewProgress,
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
              Expanded(
                //to constrain a scrollable widget so that it doesn't scroll to infinity we use expanded
                //expanded, to to make the scrollable widget take whatever remaining space is available
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: widget.url,
                  onWebViewCreated: (controller) {
                    this._webViewController = controller;
                  },
                  onProgress: (progress) =>
                      setState(() => this._webViewProgress = progress / 100),
                  //the progress has a value between 0 and 100
                  //we divide by 100 cus linearProgressIndicator only work with range of 0 to 1
                ),
              ),
            ],
          ),
          // )
        ),
      ),
    );
  }
}
