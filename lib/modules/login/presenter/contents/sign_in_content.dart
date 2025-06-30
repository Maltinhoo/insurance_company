import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:insurance_company/app_imports.dart';

class SignInContent extends StatefulWidget {
  final Function(String cpf, String password, bool keepLogged) onLogin;
  final bool isLoading;
  const SignInContent({
    super.key,
    required this.onLogin,
    this.isLoading = false,
  });

  @override
  State<SignInContent> createState() => _SignInContentState();
}

class _SignInContentState extends State<SignInContent> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool keepLoggedIn = false;

  @override
  void dispose() {
    _cpfController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb
          ? (max(MediaQuery.of(context).size.width * .15, 300))
          : double.maxFinite,
      child: Padding(
        key: const ValueKey(0),
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _cpfController,
              hint: 'CPF',
              keyboardType: TextInputType.number,

              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                MaskTextInputFormatter(
                  mask: '###.###.###-##',
                  filter: {"#": RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.lazy,
                ),
              ],
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'CPF é obrigatório';
                }
                if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$').hasMatch(p0)) {
                  return 'CPF inválido';
                }
                return null;
              },
            ),
            Gap(10),
            CustomPasswordField(
              controller: _passwordController,
              hint: 'Senha',

              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Senha é obrigatória';
                }
                if (p0.length < 6) {
                  return 'Senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            Gap(20),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        keepLoggedIn = !keepLoggedIn;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: keepLoggedIn,
                          onChanged: (value) {
                            setState(() {
                              keepLoggedIn = value ?? false;
                            });
                          },
                          shape: const CircleBorder(),
                          side: const BorderSide(color: Colors.white),
                          activeColor: const Color(0xFF00B5A0),
                          checkColor: Colors.white,
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        Gap(6),
                        CustomText('Lembrar Sempre', size: 12),
                      ],
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(color: Color(0xFF00B5A0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              isCircle: true,
              isLoading: widget.isLoading,
              border: BoxBorder.all(color: AppColors.primaryLight, width: 6),
              gradient: AppColors.buttonGradient,
              onTap: () {
                widget.onLogin(
                  _cpfController.text,
                  _passwordController.text,
                  keepLoggedIn,
                );
              },
              icon: Vector(Icons.arrow_forward, size: 36),
            ),
          ],
        ),
      ),
    );
  }
}
