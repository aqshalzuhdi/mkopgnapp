part of 'widget.dart';

class TotalWidget extends StatelessWidget {
  final String text;
  final String number;
  const TotalWidget({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: kiwiGreenTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        Text(
          text,
          style: blackTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
