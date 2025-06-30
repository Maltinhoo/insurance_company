import 'package:insurance_company/app_imports.dart';

class WebViewPage extends StatefulWidget {
  static const name = '/web-view';

  final String url;
  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final WebViewController _controller = WebViewController();

  @override
  void initState() {
    _controller.loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isWebView: true,
      child: WebViewWidget(controller: _controller),
    );
  }
}
