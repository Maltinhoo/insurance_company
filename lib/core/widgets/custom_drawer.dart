import 'package:flutter/foundation.dart';
import 'package:insurance_company/app_imports.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceLocator.locator<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignedOutSuccess) {
            context.go(LoginPage.name);
          } else if (state is AuthError) {
            CustomToast.error(context, state.message);
          }
        },
        builder: (context, state) {
          final authCubit = BlocProvider.of<AuthCubit>(context);
          return Drawer(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(50),
                  if (state is AuthSuccess)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText('Olá!', fontWeight: FontWeight.w600),
                          Gap(10),
                          Row(
                            children: [
                              CustomImage(
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40,
                                borderRadius: BorderRadius.circular(40),
                                image: state.user.imageUrl,
                              ),
                              Gap(8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    state.user.name,
                                    conversion: ConversionType.toUpperCase,
                                    fontWeight: FontWeight.w800,
                                    size: 24,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        CustomText(
                                          'Minha conta',
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.secondary,
                                          size: 12,
                                        ),
                                        Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  Gap(20),
                  _buildDrawerItem(Icons.shield, 'Home/Seguro'),
                  _buildDrawerItem(
                    Icons.account_balance_wallet,
                    'Minhas Contribuições',
                  ),
                  _buildDrawerItem(Icons.assignment, 'Meus Sinistros'),

                  _buildDrawerItem(Icons.people, 'Minha Família'),
                  _buildDrawerItem(Icons.business, 'Meus Bens'),
                  _buildDrawerItem(Icons.payment, 'Pagamentos'),
                  _buildDrawerItem(Icons.contacts, 'Contatos'),
                  _buildDrawerItem(Icons.qr_code, 'Validar Boleto'),
                  _buildDrawerItem(Icons.phone, 'Telefones Importantes'),
                  _buildDrawerItem(Icons.settings, 'Configurações'),

                  TextButton(
                    onPressed: () {
                      authCubit.signOut();
                    },
                    child: CustomText(
                      'Sair',
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (!kIsWeb) Gap(MediaQuery.of(context).size.height * .03),
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 40,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2FCF85), Color(0xFFF9D749)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: CustomImage(image: 'marina.png', local: true),
                        ),
                        Gap(16),
                        CustomText(
                          'Dúvidas?\nConverse com a assistente virtual e tire todas suas dúvidas',
                          textAlign: TextAlign.center,
                          size: 12,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: Icon(icon, color: AppColors.secondary),
      title: CustomText(title, size: 14, margin: EdgeInsets.only(left: 8)),
      onTap: () {},
    );
  }
}
