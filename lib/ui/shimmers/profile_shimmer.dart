part of 'shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: kWhiteSmokeColor,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CirclePlacholder(
            width: 120,
            height: 120,
          ),
          SizedBox(height: 32),
          TitlePlaceholder(width: double.infinity),
          SizedBox(height: 14),
          TextfieldPlaceholder(width: double.infinity),
          SizedBox(height: 14),
          TextfieldPlaceholder(width: double.infinity),
          SizedBox(height: 14),
          TextfieldPlaceholder(width: double.infinity),
          SizedBox(height: 24),
          ButtonPlaceholder(width: double.infinity),
          SizedBox(height: 8),
          ButtonPlaceholder(width: double.infinity),
        ],
      ),
    );
  }
}
