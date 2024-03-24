part of 'widget.dart';

class CompanyCardWidget extends StatefulWidget {
  final String image;
  final String name;
  final String address;
  final bool? showStatus;
  final String? status;
  final bool? showDownload;
  final String? pathFile;
  final VoidCallback? onTap;
  const CompanyCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.address,
    this.showStatus,
    this.status,
    this.showDownload,
    this.pathFile,
    this.onTap,
  });

  @override
  State<CompanyCardWidget> createState() => _CompanyCardWidgetState();
}

class _CompanyCardWidgetState extends State<CompanyCardWidget> {
  late AnimationController controller;

  // @override
  // void initState() {
  //   controller = AnimationController(
  //     /// [AnimationController]s can be created with `vsync: this` because of
  //     /// [TickerProviderStateMixin].
  //     vsync: this,
  //     duration: const Duration(seconds: 2),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat(reverse: false);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // DownloadTask? backgroundDownloadTask;
    // late String _localPath;
    // late bool _permissionReady;

    double circleProgress = 0;
    bool downloadIndicator = false;

    return GestureDetector(
      onTap: widget.onTap,
      child: CardWidget(
        child: Row(
          children: [
            Image.asset(
              "assets/pertamina.png",
              height: 56,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    widget.address,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            (widget.showStatus == true)
                ? Container(
                    decoration: BoxDecoration(
                      color:
                          (widget.status == "1") ? kKiwiGreenColor : kRedColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      (widget.status == "1") ? 'Selesai' : 'Open',
                      style: whiteTextStyle.copyWith(
                        fontSize: 8,
                        fontWeight: semiBold,
                      ),
                    ),
                  )
                : const SizedBox(),
            (widget.showDownload == true)
                ? StatefulBuilder(
                    builder: (context, setState) {
                      return GestureDetector(
                        onTap: (downloadIndicator)
                            ? null
                            : () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        "Sedang download File, jangan menutup aplikasi..."),
                                    backgroundColor: kBlackColor,
                                  ),
                                );

                                FileDownloader.downloadFile(
                                    url: widget.pathFile!,
                                    // name: **OPTIONAL**, _THE FILE NAME AFTER DOWNLOADING_,
                                    onProgress:
                                        (String? fileName, double? progress) {
                                      setState(() {
                                        downloadIndicator = true;
                                        circleProgress = progress!;
                                      });
                                    },
                                    onDownloadCompleted: (String? path) {
                                      // print('FILE DOWNLOADED TO PATH: $path');
                                      setState(() {
                                        downloadIndicator = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                              "Berhasil download File"),
                                          backgroundColor: kKiwiGreenColor,
                                        ),
                                      );
                                    },
                                    onDownloadError: (String? error) {
                                      // print('DOWNLOAD ERROR: $error');
                                      setState(() {
                                        downloadIndicator = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Gagal download File: $error"),
                                          backgroundColor: kRedColor,
                                        ),
                                      );
                                    });
                              },
                        child: (downloadIndicator == true)
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  value: (circleProgress / 100),
                                  semanticsLabel: 'Circular progress indicator',
                                ),
                              )
                            : SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  'assets/file-download.png',
                                  // color: kKiwiGreenColor,
                                ),
                              ),
                      );
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
