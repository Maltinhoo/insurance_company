import 'package:insurance_company/app_imports.dart';

class HomePage extends StatelessWidget {
  static const name = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeHeader(),
            Gap(20),
            InsuranceServices(),
            Gap(20),
            MyFamily(),
            Gap(20),
            Contractors(),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
