import 'package:insurance_company/app_imports.dart';

class ServiceItem extends StatelessWidget {
  final InsuranceService service;
  final VoidCallback? onTap;
  const ServiceItem({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: service.icon.contains('.')
                  ? CustomImage(
                      image: service.icon,
                      local: true,
                      height: 40,
                      fit: BoxFit.fill,
                    )
                  : Vector(service.icon, size: 40, fit: BoxFit.fill),
            ),
            Gap(10),
            CustomText(
              service.label,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.roboto.family,
              size: 12,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
