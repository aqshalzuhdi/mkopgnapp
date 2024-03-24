part of 'widget.dart';

class MenuActivityJobWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MenuActivityJobWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CardWidget(
        padding: const EdgeInsets.all(16),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.navigate_next,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
