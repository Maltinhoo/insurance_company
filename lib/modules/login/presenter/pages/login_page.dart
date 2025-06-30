import 'package:flutter/foundation.dart';
import 'package:insurance_company/app_imports.dart';

class LoginPage extends StatelessWidget {
  static const name = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.locator<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            CustomToast.error(context, state.message);
          } else if (state is LoginSuccess) {
            context.go(HomePage.name);
          }
        },
        builder: (context, state) {
          final loginCubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * .5,
                      decoration: BoxDecoration(gradient: AppColors.bgGradient),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: kIsWeb
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        children: [
                          Vector(Vectors.tokiomarine, color: AppColors.white),
                          Gap(20),
                          CustomText(
                            'Bem vindo!',
                            size: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          Gap(10),
                          CustomText(
                            'Aqui você gerencia seus seguros e de seus familiares em poucos cliques!',
                            size: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          Gap(MediaQuery.sizeOf(context).height * .1),
                          LoginCard(
                            isLoading: state is LoginLoading,
                            onLogin: (cpf, password, keepLogged) {
                              loginCubit.login(
                                cpf: cpf,
                                password: password,
                                keepLogged: keepLogged,
                              );
                            },
                          ),
                          Gap(MediaQuery.sizeOf(context).height * .1),
                          Center(
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'tokio\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'resolve',
                                        style: TextStyle(color: Colors.yellow),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(16),
                                CustomText(
                                  'Acesse através das redes sociais',
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                Gap(16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Vector(
                                      Vectors.google,
                                      color: AppColors.white,
                                      size: 30,
                                    ),
                                    Gap(30),
                                    Vector(
                                      Vectors.facebook,
                                      color: AppColors.white,
                                      size: 30,
                                    ),
                                    Gap(30),
                                    Vector(
                                      Vectors.twitter,
                                      color: AppColors.white,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
