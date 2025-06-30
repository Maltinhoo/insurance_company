import 'package:insurance_company/app_imports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: ServiceLocator.locator<AuthCubit>(),
      builder: (context, state) {
        if (state is! AuthSuccess) {
          return SizedBox.shrink();
        }
        return Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(gradient: AppColors.bgGradient),
          child: Row(
            children: [
              CustomImage(
                fit: BoxFit.cover,
                height: 60,
                width: 60,
                borderRadius: BorderRadius.circular(60),
                image: state.user.imageUrl,
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Bem-vindo',
                    fontWeight: FontWeight.w300,
                    color: AppColors.white.withAlpha((.7 * 255).round()),
                    fontFamily: FontFamily.roboto.family,
                    size: 14,
                  ),
                  CustomText(
                    state.user.name,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.roboto.family,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
