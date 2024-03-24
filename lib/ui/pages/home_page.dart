part of 'page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // CheckSession(context, isRefreshToken: true);
    // context.read<ProfileCubit>().Fetch();
    // context.read<TaskCubit>().Fetch();

    void ApiFunction() async {
      try {
        await CheckSession(context);
        context.read<TroubleReportCubit>().Fetch(page: 1, limit: 5);
        context.read<TaskCubit>().Fetch(page: 1, limit: 5);
        context.read<TotalCubit>().Fetch();
        context.read<ProfileCubit>().Fetch();
        // print(await getAuthorizationSession());
      } catch (e) {}
    }

    return Column(
      children: [
        BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            print(state);
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (_, state) => (state is ProfileSuccess)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/profile.png',
                        height: 58,
                        width: 58,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ('Hi, ') + state.user.name.toString(),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            state.user.nip.toString(),
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const UserHomeShimmer(),
          ),
        ),
        BlocBuilder<TotalCubit, TotalState>(
          builder: (_, state) => (state is TotalSuccess)
              ? Column(
                  children: [
                    const SizedBox(height: 14),
                    CardWidget(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 28,
                      ),
                      margin: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TotalWidget(
                              text: 'OM', number: state.total.om.toString()),
                          const SizedBox(width: 18),
                          TotalWidget(
                              text: 'TPG', number: state.total.tpg.toString()),
                          const SizedBox(width: 18),
                          TotalWidget(
                              text: 'AMR', number: state.total.amr.toString()),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
        // const SizedBox(height: 24),
        // Row(
        //   children: [
        //     Image.asset(
        //       'assets/amr.png',
        //       height: 20,
        //     ),
        //     Image.asset(
        //       'assets/tpg_add.png',
        //       height: 20,
        //     ),
        //     Image.asset(
        //       'assets/amr.png',
        //       height: 20,
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 14),
        // CardWidget(
        //   padding: const EdgeInsets.symmetric(
        //     vertical: 14,
        //     horizontal: 24,
        //   ),
        //   margin: EdgeInsets.all(0),
        //   child: Expanded(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             Get.to(CompanyAvailablePage());
        //           },
        //           child: Row(
        //             children: [
        //               Image.asset(
        //                 'assets/fluent-mdl2_add-work.png',
        //                 width: 24,
        //                 height: 24,
        //               ),
        //               SizedBox(width: 8),
        //               Text(
        //                 'Buat OM AMR',
        //                 style: blackTextStyle.copyWith(
        //                   fontSize: 12,
        //                   fontWeight: medium,
        //                 ),
        //                 maxLines: 1,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //             ],
        //           ),
        //         ),
        //         Container(
        //           width: 0.5,
        //           padding: EdgeInsets.all(14),
        //           color: kBlackColor,
        //         ),
        //         GestureDetector(
        //           onTap: () {},
        //           child: Row(
        //             children: [
        //               Image.asset(
        //                 'assets/exclamation.png',
        //                 width: 22,
        //                 height: 22,
        //               ),
        //               SizedBox(width: 8),
        //               Text(
        //                 'Lapor TPG',
        //                 style: blackTextStyle.copyWith(
        //                   fontSize: 12,
        //                   fontWeight: medium,
        //                 ),
        //                 maxLines: 1,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const SizedBox(height: 24),
        BlocListener<TaskCubit, TaskState>(
          listener: (context, state) {
            if (state is TaskFailed) {
              if (state.exception['status']) {
                errorModalBottom(
                  context: context,
                  exception: state.exception,
                  onPressed: () {
                    ApiFunction();
                    Navigator.pop(context);
                  },
                );
              }
            }
          },
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (_, state) => (state is TaskSuccess)
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'OM AMR',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const TaskPage());
                            },
                            child: Row(
                              children: [
                                // Text(
                                //   'Lihat',
                                //   style: kiwiGreenTextStyle.copyWith(
                                //     fontSize: 14,
                                //     fontWeight: medium,
                                //   ),
                                // ),
                                // const SizedBox(height: 4),
                                // Image.asset(
                                //   'assets/ri_arrow-down-line.png',
                                //   height: 18,
                                // ),
                                Image.asset(
                                  'assets/fe_bar.png',
                                  height: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: state.task
                            .map((e) => TaskItemWidget(
                                  task: e,
                                  onTap: () {
                                    print(e);
                                    Get.to(() => TaskDetailPage(
                                          companyId: (e.company!.id == null)
                                              ? 0
                                              : e.company!.id!,
                                          taskId: (e.id == null) ? 0 : e.id!,
                                        ));
                                  },
                                  showStatus: true,
                                ))
                            .toList(),
                      )
                    ],
                  )
                : const Column(
                    children: [
                      SizedBox(height: 8),
                      TaskShimmer(),
                      SizedBox(height: 8),
                      TaskShimmer(),
                      SizedBox(height: 8),
                      TaskShimmer(),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 14),
        // BlocBuilder<TroubleReportCubit, TroubleReportState>(
        //     builder: (_, state) {
        //   print("trouble: ${state}");
        //   return (state is TroubleReportSuccess)
        //       ? Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text(
        //                   'TPG / Gangguan',
        //                   style: blackTextStyle.copyWith(
        //                     fontSize: 14,
        //                     fontWeight: medium,
        //                   ),
        //                 ),
        //                 Row(
        //                   children: [
        //                     GestureDetector(
        //                       onTap: () {
        //                         Get.to(const TroubleReportPage());
        //                       },
        //                       child: Row(
        //                         children: [
        //                           Container(
        //                             width: 12,
        //                             height: 12,
        //                             margin: const EdgeInsets.only(left: 8),
        //                             decoration: const BoxDecoration(
        //                               image: DecorationImage(
        //                                 image:
        //                                     AssetImage('assets/plus_add.png'),
        //                               ),
        //                             ),
        //                           ),
        //                           // const SizedBox(width: 8),
        //                           // Text(
        //                           //   'Lapor',
        //                           //   style: kiwiGreenTextStyle.copyWith(
        //                           //     fontSize: 14,
        //                           //     fontWeight: medium,
        //                           //   ),
        //                           // ),
        //                           // const SizedBox(width: 4),
        //                           // Image.asset(
        //                           //   'assets/plus_add.png',
        //                           //   height: 14,
        //                           //   color: kKiwiGreenColor,
        //                           // ),
        //                         ],
        //                       ),
        //                     ),
        //                     const SizedBox(width: 14),
        //                     GestureDetector(
        //                       onTap: () {
        //                         Get.to(const TroubleReportPage());
        //                       },
        //                       child: Row(
        //                         children: [
        //                           // Container(
        //                           //   width: 14,
        //                           //   height: 14,
        //                           //   margin: const EdgeInsets.only(left: 8, right: 8),
        //                           //   decoration: const BoxDecoration(
        //                           //     image: DecorationImage(
        //                           //       image: AssetImage('assets/plus_add.png'),
        //                           //     ),
        //                           //   ),
        //                           // ),
        //                           // const SizedBox(width: 8),
        //                           // Text(
        //                           //   'Lihat',
        //                           //   style: kiwiGreenTextStyle.copyWith(
        //                           //     fontSize: 14,
        //                           //     fontWeight: medium,
        //                           //   ),
        //                           // ),
        //                           // const SizedBox(height: 4),
        //                           // Image.asset(
        //                           //   'assets/ri_arrow-down-line.png',
        //                           //   height: 18,
        //                           // ),
        //                           Image.asset(
        //                             'assets/fe_bar.png',
        //                             height: 18,
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(height: 16),
        //             Column(
        //               children: state.data
        //                   .map((e) => TroubleReportItemWidget(
        //                         troubleReport: e,
        //                         onTap: () {
        //                           // Get.to(() => TaskDetailPage(
        //                           //       company_id: (e.company!.id == null)
        //                           //           ? 0
        //                           //           : e.company!.id!,
        //                           //     ));
        //                         },
        //                       ))
        //                   .toList(),
        //             ),
        //             // const SizedBox(height: 8),
        //             // Column(
        //             //   children: [
        //             //     ButtonWidget(
        //             //       text: "Lapor TPG",
        //             //       width: MediaQuery.of(context).size.width / 3,
        //             //       height: 34,
        //             //       backgroundColor: kKiwiGreenColor,
        //             //       onPressed: () {},
        //             //       isLoading: false,
        //             //     ),
        //             //   ],
        //             // ),
        //           ],
        //         )
        //       : const Column(
        //           children: [
        //             SizedBox(height: 8),
        //             TaskShimmer(),
        //             SizedBox(height: 8),
        //             TaskShimmer(),
        //             SizedBox(height: 8),
        //             TaskShimmer(),
        //           ],
        //         );
        // }),
      ],
    );
  }
}
