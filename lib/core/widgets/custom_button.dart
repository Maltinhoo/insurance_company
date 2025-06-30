import 'package:insurance_company/app_imports.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool enabled;
  final Color? color;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final TextDirection? textDirection;
  final Gradient? gradient;
  final Widget? prefix;
  final Widget? suffix;
  final bool isCircle;
  final bool vertical;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final bool isLoading;
  const CustomButton({
    super.key,
    this.icon,
    this.label,
    this.onTap,
    this.width,
    this.height,
    this.enabled = true,
    this.color,
    this.borderRadius,
    this.textStyle,
    this.textDirection,
    this.gradient,
    this.prefix,
    this.suffix,
    this.isCircle = false,
    this.vertical = false,
    this.padding,
    this.border,
    this.isLoading = false,
  }) : assert(!(icon == null && label == null));

  Color get _getColorEnabled {
    if (!enabled) {
      return AppColors.gray;
    }
    return (color ?? AppColors.primaryLight);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: gradient == null ? _getColorEnabled : Colors.transparent,
        borderRadius: borderRadius ?? BorderRadius.circular(100),
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: borderRadius ?? BorderRadius.circular(100),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: gradient,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((.7 * 255).round()),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ],
              borderRadius: borderRadius ?? BorderRadius.circular(100),
              border: border,
            ),
            padding:
                padding ??
                (isCircle
                    ? EdgeInsets.all(12)
                    : EdgeInsets.symmetric(vertical: 15.5, horizontal: 20)),
            child: isLoading
                ? CircularProgressIndicator(color: AppColors.secondary)
                : Flex(
                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (prefix != null) ...[
                        FittedBox(fit: BoxFit.scaleDown, child: prefix!),
                        Gap(vertical ? 10 : 16),
                      ],
                      if (icon != null) ...[
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: icon ?? const SizedBox.shrink(),
                        ),
                        if (label != null) Gap(vertical ? 10 : 8),
                      ],
                      if (label != null)
                        Flexible(
                          child: CustomText(
                            label!,
                            textAlign: TextAlign.center,
                            textDirection: textDirection,
                            textStyle:
                                textStyle ??
                                TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: enabled
                                      ? AppColors.white
                                      : AppColors.label,
                                ),
                          ),
                        ),
                      if (suffix != null) ...[
                        Gap(16),
                        FittedBox(fit: BoxFit.scaleDown, child: suffix!),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
