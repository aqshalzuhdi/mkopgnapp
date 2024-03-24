part of 'widget.dart';

class DocumentationItemWidget extends StatelessWidget {
  final int id;
  final int taskId;
  final String title;
  final List<Widget>? children;
  final String? pictureUrl;
  final bool? onTapStatus;

  const DocumentationItemWidget({
    super.key,
    required this.id,
    required this.taskId,
    required this.title,
    this.children,
    this.pictureUrl,
    this.onTapStatus = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    String imgBase64 = "";

    final ImagePicker picker = ImagePicker();
    File? pictureFile;

    return GestureDetector(
      onTap: (onTapStatus == true)
          ? () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return WillPopScope(
                    onWillPop: () async {
                      imgBase64 = "";
                      pictureFile = null;
                      // _titleController.clear();
                      return true;
                    },
                    child: StatefulBuilder(
                      builder:
                          (BuildContext context, StateSetter setModalState) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: kGreyColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          title,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: medium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  SafeArea(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        (pictureFile != null)
                                            ? Container(
                                                height: 180,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: FileImage(
                                                      pictureFile!,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                            : ((pictureUrl != null)
                                                ? Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      // width: double.infinity,
                                                      height: 180,
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: Image.network(
                                                        pictureUrl!,
                                                        fit: BoxFit.cover,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          try {
                                                            if (loadingProgress ==
                                                                null)
                                                              return child;
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                value: loadingProgress
                                                                            .expectedTotalBytes !=
                                                                        null
                                                                    ? loadingProgress
                                                                            .cumulativeBytesLoaded /
                                                                        loadingProgress
                                                                            .expectedTotalBytes!
                                                                    : null,
                                                              ),
                                                            );
                                                          } catch (e) {
                                                            print(e);
                                                            rethrow;
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    // width: double.infinity,
                                                    height: 180,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/no_image_available.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  )),
                                        const SizedBox(height: 14),
                                        GestureDetector(
                                          onTap: () async {
                                            final XFile? camera =
                                                await picker.pickImage(
                                                    source: ImageSource.camera);

                                            if (camera != null) {
                                              pictureFile = File(camera.path);
                                              setModalState(() {});

                                              imgBase64 = base64Encode(
                                                await camera.readAsBytes(),
                                              );

                                              // Navigator.pop(context);
                                            } else {
                                              print("error");
                                            }
                                          },
                                          child: CardWidget(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/camera.png',
                                                    width: 22,
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Text(
                                                    'Camera',
                                                    style:
                                                        blackTextStyle.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: medium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            final XFile? image =
                                                await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);

                                            if (image != null) {
                                              pictureFile = File(image.path);
                                              setModalState(() {});

                                              imgBase64 = base64Encode(
                                                await image.readAsBytes(),
                                              );

                                              // Navigator.pop(context);
                                            } else {
                                              print("error");
                                            }
                                          },
                                          child: CardWidget(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/gallery.png',
                                                    width: 22,
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Text(
                                                    'Galeri',
                                                    style:
                                                        blackTextStyle.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: medium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(children: children ?? []),
                                        const SizedBox(height: 14),
                                        ButtonWidget(
                                          height: 32,
                                          text: 'Simpan',
                                          backgroundColor: kKiwiGreenColor,
                                          onPressed: () async {
                                            isLoading = true;
                                            setModalState(() {});

                                            print("id: ${id}");

                                            await context
                                                .read<
                                                    TaskDocumentationSubmitCubit>()
                                                .UpdateData(
                                                  id: id.toString(),
                                                  taskId: taskId.toString(),
                                                  base64: imgBase64,
                                                );

                                            TaskDocumentationSubmitState state =
                                                context
                                                    .read<
                                                        TaskDocumentationSubmitCubit>()
                                                    .state;

                                            var message = "";
                                            Color backgroundColor = kRedColor;

                                            if (state
                                                is TaskDocumentationSubmitSuccess) {
                                              backgroundColor = kKiwiGreenColor;
                                              message = state.message;
                                            } else if (state
                                                is TaskDocumentationSubmitFailed) {
                                              message = state.message;
                                              backgroundColor = kRedColor;
                                            }

                                            context
                                                .read<TaskDocumentationCubit>()
                                                .Fetch(taskId);

                                            imgBase64 = "";
                                            pictureFile = null;

                                            isLoading = false;
                                            setModalState(() {});
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(message),
                                                backgroundColor:
                                                    backgroundColor,
                                              ),
                                            );
                                          },
                                          isLoading: isLoading,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          : () {},
      child: CardWidget(
        padding: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width / 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (pictureUrl != null)
                ? Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Image.network(
                      pictureUrl!,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        try {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        } catch (e) {
                          print(e);
                          rethrow;
                        }
                      },
                    ),
                  )
                : Container(
                    // width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/no_image_available.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
            Container(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
