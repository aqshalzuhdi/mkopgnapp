part of 'shared.dart';

Future<void> modalBottomSheet(
    BuildContext context, List<Widget> children, bool isDismissible) {
  return showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    backgroundColor: kWhiteColor,
    isScrollControlled: true,
    enableDrag: isDismissible,
    isDismissible: isDismissible,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isDismissible
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4,
                          width: 100,
                          decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(height: 14),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

void errorModalBottom(
    {required BuildContext context,
    required Map<String, dynamic> exception,
    VoidCallback? onPressed}) {
  // List<String> split = content.split("|");
  // int splitLength = split.length;

  // print("length: ${split.length}");

  // String image = split[0];
  // String title = split[1];
  // String subTitle = split[2];
  // String msg = split[3];
  // String? btnText = (splitLength == 5) ? split[4] : "";

  modalBottomSheet(
      context,
      [
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Image.asset(("assets/") + exception['image'].toString()),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            exception['title'].toString(),
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 14),
        Center(
          child: Text(
            exception['subTitle'].toString(),
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            exception['msg'].toString(),
            style: greyTextStyle.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 18),
        (onPressed != null && exception['button']!.isNotEmpty)
            ? Column(
                children: [
                  ButtonWidget(
                    height: 38,
                    text: exception['button'],
                    onPressed: (exception['button'] == 'Refresh')
                        ? onPressed
                        : (exception['button'] == 'Kembali')
                            ? () {
                                Get.back();
                                Navigator.pop(context);
                              }
                            : () {},
                    isLoading: false,
                  ),
                  const SizedBox(height: 14),
                ],
              )
            : const SizedBox(),
      ],
      false);
}

Future<void> CheckSession(BuildContext context, {bool? isRefreshToken}) async {
  try {
    bool isUnauthorized = false;

    if (isRefreshToken == true) {
      await context.read<RefreshTokenCubit>().Fetch();
      RefreshTokenState stateRefreshToken =
          context.read<RefreshTokenCubit>().state;

      // print(await getAuthorizationSession());

      if (stateRefreshToken is RefreshTokenFailed) isUnauthorized = true;
    } else {
      await context.read<ProfileCubit>().Fetch();
      ProfileState stateProfile = context.read<ProfileCubit>().state;

      // print(await getAuthorizationSession());

      if (stateProfile is ProfileUnauthorized) isUnauthorized = true;
    }

    if (isUnauthorized) {
      destroyAllSession();
      Get.offAll(() => const LoginPage());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sesi telah berakhir, silahkan login kembali!"),
          backgroundColor: kRedColor,
        ),
      );
    }
  } catch (e) {
    print(e);
    return;
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(e.toString()),
    //     backgroundColor: kRedColor,
    //   ),
    // );
  }
}

Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}

class Debouncer {
  final int milliseconds;
  late VoidCallback action;
  late Timer _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer.isActive) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

void submitTaskResult(
  BuildContext context,
  String taskId,
  String taskDetailId,
  String value,
) async {
  await context.read<TaskResultSubmitCubit>().Store(
        taskId: taskId,
        taskDetailId: taskDetailId,
        value: value,
      );

  TaskResultSubmitState state = context.read<TaskResultSubmitCubit>().state;
  String message = "";
  Color backgroundColor = kKiwiGreenColor;
  if (state is TaskResultSubmitSuccess) {
    message = state.message;
    backgroundColor = kKiwiGreenColor;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  } else if (state is TaskResultSubmitFailed) {
    // message = state.message;
    // backgroundColor = kRedColor;
  }

  // print(state);
}
