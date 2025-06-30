import 'package:insurance_company/app_imports.dart';

class LoginCard extends StatefulWidget {
  final Function(String cpf, String password, bool keepLogged) onLogin;
  final bool isLoading;
  const LoginCard({super.key, required this.onLogin, required this.isLoading});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      children: [
        Positioned.fill(
          bottom: 36,
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((.7 * 255).round()),
                  blurRadius: 6,
                  spreadRadius: 1,
                  offset: Offset(5, 7),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTab('Entrar', 0),
                  Gap(30),
                  _buildTab('Cadastrar', 1),
                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: _selectedIndex == 0
                    ? SignInContent(
                        isLoading: widget.isLoading,
                        onLogin: (cpf, password, keepLogged) {
                          widget.onLogin(cpf, password, keepLogged);
                        },
                      )
                    : Container(
                        key: const ValueKey(1),
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Conteúdo da Tab 2'),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.secondary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: CustomText(
          label,
          size: isSelected ? 14 : 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w700,
          color: isSelected ? AppColors.secondary : Colors.white,
        ),
      ),
    );
  }
}
