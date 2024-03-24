part of 'widget.dart';

class CompanyItemWidget extends StatelessWidget {
  final Company company;
  final VoidCallback? onTap;
  const CompanyItemWidget({
    super.key,
    required this.company,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CompanyCardWidget(
      image: "assets/pertamina.png",
      name: company.name.toString(),
      address: company.address.toString(),
      onTap: onTap,
    );
  }
}
