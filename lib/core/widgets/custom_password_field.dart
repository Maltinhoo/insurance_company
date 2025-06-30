import 'package:insurance_company/app_imports.dart';

class CustomPasswordField extends StatefulWidget {
  final String? hint, label;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Color? borderColor;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? initialValue;

  const CustomPasswordField({
    super.key,
    this.hint,
    this.validator,
    this.controller,
    this.onChanged,
    this.label,
    this.borderColor,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.initialValue,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;
  late final TextEditingController _controller;
  bool _showEyeIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _showEyeIcon = _controller.text.isNotEmpty;

    _controller.addListener(() {
      final shouldShow = _controller.text.isNotEmpty;
      if (shouldShow != _showEyeIcon) {
        setState(() {
          _showEyeIcon = shouldShow;
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: widget.hint ?? 'Senha',
      validator: widget.validator,
      controller: _controller,
      onChanged: widget.onChanged,
      borderColor: widget.borderColor,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      initialValue: widget.initialValue,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      suffixIcon: _showEyeIcon
          ? IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
                fixedSize: const Size(0, 0),
              ),
              icon: Vector(
                obscureText ? Vectors.closed_eye : Vectors.eye,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            )
          : null,
    );
  }
}
