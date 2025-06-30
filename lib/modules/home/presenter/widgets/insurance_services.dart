import 'package:insurance_company/app_imports.dart';

class InsuranceServices extends StatelessWidget {
  const InsuranceServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'Cotar e Contratar',
          margin: EdgeInsets.symmetric(horizontal: 20),
          fontWeight: FontWeight.w800,
          fontFamily: FontFamily.roboto.family,
          size: 24,
        ),
        Gap(8),
        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return ServiceItem(
                onTap:
                    InsuranceService.values.indexOf(
                          InsuranceService.values[index],
                        ) ==
                        InsuranceService.automobile.index
                    ? () {
                        context.push(
                          WebViewPage.name,
                          extra: {
                            'url': 'https://jsonplaceholder.typicode.com/',
                          },
                        );
                      }
                    : null,
                service: InsuranceService.values[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Gap(10);
            },
            itemCount: InsuranceService.values.length,
          ),
        ),
      ],
    );
  }
}
