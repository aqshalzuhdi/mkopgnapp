part of 'widget.dart';

class ResultFormWidget extends StatelessWidget {
  final String title;
  final List<Widget> checkBox;
  final TextEditingController controller;
  const ResultFormWidget({
    super.key,
    required this.title,
    required this.checkBox,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          Row(
            children: checkBox,
          ),
          SizedBox(height: 8),
          TextfieldWidget(
            label: 'Keterangan',
            obsecureText: false,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
