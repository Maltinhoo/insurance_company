import 'package:insurance_company/app_imports.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? child;
  final bool isWebView;
  const CustomScaffold({super.key, this.child, this.isWebView = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(isWebView: isWebView),
      ),
      body: child,
    );
  }
}
