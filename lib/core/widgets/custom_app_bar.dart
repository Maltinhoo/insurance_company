import 'package:insurance_company/app_imports.dart';

class CustomAppBar extends StatelessWidget {
  final bool isWebView;
  const CustomAppBar({super.key, required this.isWebView});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isWebView
          ? IconButton(
              icon: Vector(Icons.arrow_back, color: Colors.white, size: 26),
              onPressed: () {
                context.pop();
              },
            )
          : IconButton(
              icon: Vector(Vectors.menu, color: Colors.white, size: 26),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
      title: Vector(Vectors.tokiomarine, color: Colors.white),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Badge(
            largeSize: 8,
            smallSize: 8,
            alignment: Alignment(.6, -.8),
            backgroundColor: Colors.red,
            child: Vector(Vectors.bell, color: Colors.white, size: 26),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
