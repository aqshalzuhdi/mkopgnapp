part of 'shimmer.dart';

class DocumentationShimmer extends StatelessWidget {
  const DocumentationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: kWhiteSmokeColor,
      enabled: true,
      child: Column(
        // spacing: 14,
        // runSpacing: 14,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
          RectanglePlaceholder(),
          SizedBox(height: 14),
          TitlePlaceholder(width: 100),
        ],
      ),
    );
  }
}
