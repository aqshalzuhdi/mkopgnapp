part of 'page.dart';

class TaskDetailPage extends StatelessWidget {
  final int companyId;
  final int taskId;
  const TaskDetailPage({
    super.key,
    required this.companyId,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController serialNumberController = TextEditingController();

    void ApiFunction() async {
      CheckSession(context);
      context.read<TaskDetailCubit>().Fetch(taskId);
      context.read<TaskCategoryCubit>().Fetch();
      context.read<TaskResultCubit>().Fetch(taskId, null);
      context.read<TabBarTaskResultCubit>().changeState(0);
    }

    ApiFunction();

    return GeneralPage(
      title: 'Formulir OM AMR',
      centerTitle: true,
      backgroundColor: kWhiteColor,
      onRefresh: () async {
        ApiFunction();
        // CheckSession(context);
        // // context.read<TabBarTaskResultCubit>().changeState(0);
        // context.read<TaskDetailCubit>().Fetch(taskId);
        // context.read<TaskResultCubit>().Fetch(taskId, null);
      },
      onBackButtonPressed: () {
        Get.back();
      },
      appBarActions: [
        GestureDetector(
          onTap: () {
            Get.to(TaskPreviewPage(companyId: companyId, taskId: taskId));
          },
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 16),
            child: Image.asset('assets/pdf-export.png'),
          ),
        ),
      ],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.to(DokumentasiPage());
      //   },
      //   backgroundColor: kBlackColor,
      //   child: const Icon(Icons.image),
      // ),
      children: [
        BlocBuilder<TaskDetailCubit, TaskDetailState>(
          builder: (_, state) {
            if (state is TaskDetailSuccess) {
              return Column(
                children: [
                  TaskItemWidget(
                    task: state.task,
                    showDownload: (state.task.taskExport != null)
                        ? ((state.task.taskExport!.status == 1) ? true : false)
                        : false,
                    pathFile: (state.task.taskExport != null)
                        ? (state.task.taskExport!.path)
                        : null,
                  ),
                  CardWidget(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tanggal Dikerjakan',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          (state.task.dateOfCompletion == "-")
                              ? DateFormat("d-MMMM-yyyy").format(DateTime.now())
                              : state.task.dateOfCompletion!,
                          style: blackTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  CardWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DeviceTaskWidget(task: state.task),
                        const SizedBox(height: 16),
                        ButtonWidget(
                          text: 'Ganti',
                          onPressed: () {
                            modalBottomSheet(
                              context,
                              [
                                GestureDetector(
                                  onTap: () {},
                                  child: CardWidget(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/qrcode.png',
                                            width: 18,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            'Scan',
                                            style: blackTextStyle.copyWith(
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
                                  onTap: () {
                                    Navigator.pop(context);
                                    modalBottomSheet(
                                      context,
                                      [
                                        TextfieldWidget(
                                          label: 'Nomor Seri',
                                          obsecureText: false,
                                          controller: serialNumberController,
                                        ),
                                        const SizedBox(height: 18),
                                        ButtonWidget(
                                          height: 36,
                                          text: 'Cek',
                                          onPressed: () {
                                            Navigator.pop(context);
                                            modalBottomSheet(
                                              context,
                                              [
                                                DeviceTaskWidget(
                                                    task: state.task),
                                                const SizedBox(height: 24),
                                                ButtonWidget(
                                                  height: 38,
                                                  text: 'Ganti',
                                                  onPressed: () {},
                                                  isLoading: false,
                                                  backgroundColor:
                                                      kKiwiGreenColor,
                                                ),
                                                const SizedBox(height: 14),
                                                ButtonWidget(
                                                  height: 38,
                                                  text: 'Batal',
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  isLoading: false,
                                                  backgroundColor: kBlackColor,
                                                ),
                                              ],
                                              true,
                                            );
                                          },
                                          isLoading: false,
                                          backgroundColor: kKiwiGreenColor,
                                        ),
                                      ],
                                      true,
                                    );
                                  },
                                  child: CardWidget(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/serial_number.png',
                                            width: 18,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            'Nomor Seri',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: medium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              true,
                            );
                          },
                          isLoading: false,
                          height: 32,
                          backgroundColor: kKiwiGreenColor,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ('Terakhir diganti ') +
                              ((state.task.company!.device == null)
                                  ? ''
                                  : state.task.company!.device!.updatedAt
                                      .toString()),
                          style: blackTextStyle.copyWith(
                            fontSize: 8,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // TabBarTaskResultPage(),
                  BlocBuilder<TaskCategoryCubit, TaskCategoryState>(
                    builder: (_, stateCategory) => (stateCategory
                            is TaskCategorySuccess)
                        ? BlocBuilder<TabBarTaskResultCubit,
                            TabBarTaskResultState>(
                            builder: (_, stateTabBar) {
                              return (stateTabBar is TabBarTaskResult)
                                  ? Column(
                                      children: [
                                        CustomTabBarWidget(
                                          titles: stateCategory.taskCategory
                                              .map((e) => e.name.toString())
                                              .toList(),
                                          selectedIndex: stateTabBar.index,
                                          onTap: (index) {
                                            context
                                                .read<TabBarTaskResultCubit>()
                                                .changeState(index);
                                          },
                                        ),
                                        // SizedBox(height: 6),
                                        Builder(
                                          builder: (_) {
                                            // Widget e = Container();
                                            List<Widget> w = stateCategory
                                                .taskCategory
                                                .asMap()
                                                .entries
                                                .map((e) {
                                              return (e.value.key ==
                                                      "DOCUMENTATIONS")
                                                  ? DokumentasiTabBarItemPage(
                                                      taskId: taskId,
                                                    )
                                                  : OMFormTabBarItemPage(
                                                      categoryId: stateCategory
                                                          .taskCategory[
                                                              stateTabBar.index]
                                                          .id!,
                                                      taskId: taskId,
                                                    );
                                            }).toList();

                                            return w[stateTabBar.index];
                                            //     .forEach((key, value) {
                                            //   print(value.key);

                                            // });
                                            // return e;
                                          },
                                        ),
                                      ],
                                    )
                                  // ? Column(
                                  //     children: [
                                  //       CustomTabBarWidget(
                                  //         titles: const [
                                  //           'Kelengkapan AMR',
                                  //           'Fisik AMR',
                                  //           'Kondisi Operasional AMR',
                                  //           'Kondisi EVC',
                                  //           'Kartu GSM',
                                  //           'Catatan Khusus',
                                  //           'Dokumentasi',
                                  //         ],
                                  //         selectedIndex: state.index,
                                  //         onTap: (index) {
                                  //           context
                                  //               .read<TabBarTaskResultCubit>()
                                  //               .changeState(index);
                                  //         },
                                  //       ),
                                  //       // SizedBox(height: 6),
                                  //       Builder(
                                  //         builder: (_) {
                                  //           // String body = (state.index == 0)
                                  //           //     ? 'asd'
                                  //           //     : (state.index == 1)
                                  //           //         ? 'asd 2'
                                  //           //         : 'asd 3';

                                  //           Widget e = Container();
                                  //           switch (state.index) {
                                  //             case 0:
                                  //               e = KelengkapanAmrTabBarItemPage(
                                  //                   taskId: taskId);
                                  //               break;
                                  //             case 1:
                                  //               e = FisikAmrTabBarItemPage(
                                  //                   taskId: taskId);
                                  //               break;
                                  //             case 2:
                                  //               e = OperasionalAmrTabBarItemPage(
                                  //                   taskId: taskId);
                                  //               break;
                                  //             case 3:
                                  //               e = KondisiEvcTabBarItemPage(
                                  //                   taskId: taskId);
                                  //               break;
                                  //             case 4:
                                  //               e = KartuGsmTabBarItemPage(
                                  //                   taskId: taskId);
                                  //               break;
                                  //             case 5:
                                  //               e = CatatanKhususTabBarItemPage(
                                  //                   taskId: taskId);
                                  //               break;
                                  //             case 6:
                                  //               e = DokumentasiTabBarItemPage(
                                  //                   taskId: taskId);
                                  //               break;
                                  //           }

                                  //           return e;
                                  //         },
                                  //       ),
                                  //     ],
                                  //   )
                                  : const SizedBox();
                            },
                          )
                        : const SizedBox(),
                  ),
                ],
              );
            } else {
              return const TaskShimmer();
            }
          },
        ),

        // Text(
        //   'Kegiatan',
        //   style: blackTextStyle.copyWith(
        //     fontSize: 14,
        //     fontWeight: semiBold,
        //   ),
        // ),
        // SizedBox(height: 8),
        // MenuActivityTaskWidget(
        //     title: 'Kelengkapan AMR',
        //     onTap: () {
        //       Get.to(AmrKelengkapanPage(id: id));
        //     }),
        // MenuActivityTaskWidget(title: 'Kondisi Fisik AMR', onTap: () {}),
        // MenuActivityTaskWidget(title: 'Kondisi Operasional AMR', onTap: () {}),
        // MenuActivityTaskWidget(title: 'Kondisi EVC', onTap: () {}),
        // MenuActivityTaskWidget(title: 'Kartu GSM', onTap: () {}),
        // MenuActivityTaskWidget(title: 'Dokumentasi', onTap: () {}),
      ],
    );
  }
}
