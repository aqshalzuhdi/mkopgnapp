part of 'widget.dart';

class CustomTabBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  const CustomTabBarWidget({
    super.key,
    required this.titles,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: titles
            .map(
              (e) => Row(
                children: [
                  SizedBox(width: (titles.indexOf(e) == 0) ? 8 : 0),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          onTap(titles.indexOf(e));
                        },
                        child: Text(
                          e,
                          style: (titles.indexOf(e) == selectedIndex)
                              ? blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                )
                              : greyTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: 48,
                        height: 3,
                        margin: const EdgeInsets.only(top: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.5),
                          color: (titles.indexOf(e) == selectedIndex)
                              ? kBlackColor
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: (titles.length - 1 == titles.indexOf(e)) ? 8 : 24,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
