import 'package:insurance_company/app_imports.dart';

class Contractors extends StatelessWidget {
  const Contractors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'Contratados',
          margin: EdgeInsets.symmetric(horizontal: 20),
          fontWeight: FontWeight.w800,
          fontFamily: FontFamily.roboto.family,
          size: 24,
        ),
        Gap(8),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Vector(Vectors.sad, color: AppColors.white, size: 50),
              Gap(20),
              CustomText(
                'Você ainda não possui seguros contratados',
                margin: EdgeInsets.symmetric(horizontal: 20),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontFamily: FontFamily.roboto.family,
                size: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
