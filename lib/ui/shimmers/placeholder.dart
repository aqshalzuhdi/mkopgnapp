part of 'shimmer.dart';

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 12.0,
          color: Colors.white,
        ),
      ],
    );
  }
}

class CirclePlacholder extends StatelessWidget {
  final double? width;
  final double? height;

  const CirclePlacholder({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 60,
      height: height ?? 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

class RectanglePlaceholder extends StatelessWidget {
  const RectanglePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

enum ContentLineTypePlaceholder {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineTypePlaceholder lineType;

  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 96,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 10.0,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 8.0),
              ),
              if (lineType == ContentLineTypePlaceholder.threeLines)
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
              Container(
                width: 100.0,
                height: 10.0,
                color: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }
}

class TextfieldPlaceholder extends StatelessWidget {
  final double width;

  const TextfieldPlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitlePlaceholder(width: 100),
        SizedBox(height: 12),
        Container(
          width: width,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ],
    );
  }
}

class ButtonPlaceholder extends StatelessWidget {
  final double width;

  const ButtonPlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
