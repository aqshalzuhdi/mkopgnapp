part of 'shimmer.dart';

class TaskShimmer extends StatelessWidget {
  const TaskShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: kWhiteSmokeColor,
      enabled: true,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              RectanglePlaceholder(),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlePlaceholder(width: double.infinity),
                    SizedBox(height: 8),
                    TitlePlaceholder(width: 100),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
