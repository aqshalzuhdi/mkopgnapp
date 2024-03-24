part of 'page.dart';

class TaskPreviewPage extends StatelessWidget {
  final int companyId;
  final int taskId;
  const TaskPreviewPage({
    super.key,
    required this.companyId,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    void ApiFunction() {
      CheckSession(context);
      context.read<TaskCategoryCubit>().Fetch();
      // context.read<TaskResultCubit>().Fetch(taskId);
      context.read<TaskDetailCubit>().Fetch(taskId);
      context.read<TaskDocumentationCubit>().Fetch(taskId);
    }

    ApiFunction();

    return GeneralPage(
      title: "Preview OM AMR",
      centerTitle: true,
      backgroundColor: kWhiteColor,
      onBackButtonPressed: () {
        Get.back();
      },
      onRefresh: () async {
        ApiFunction();
      },
      children: [
        // Text(DateFormat("yyyy-MM-dd").format(DateTime.now())),
        BlocListener<TaskResultCubit, TaskResultState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<TaskDetailCubit, TaskDetailState>(
            builder: (_, state) {
              print(state);
              if (state is TaskDetailSuccess) {
                return Column(
                  children: [
                    TaskItemWidget(task: state.task),
                    CardWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DeviceTaskWidget(task: state.task),
                          const SizedBox(height: 16),
                          Text(
                            ('Terakhir diganti ') +
                                state.task.company!.device!.updatedAt
                                    .toString(),
                            style: blackTextStyle.copyWith(
                              fontSize: 8,
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CardWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tanggal Pengerjaan',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: medium,
                              )),
                          Text(state.task.dateOfCompletion.toString(),
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ))
                        ],
                      ),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: (state.task.result != null)
                          ? state.task.result!
                              .map(
                                (d) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (d.taskDetail == null) ? '' : d.name!,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    CardWidget(
                                      child: Wrap(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        runAlignment:
                                            WrapAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: d.taskDetail!
                                            .map(
                                              (e) => (d.key.toString() !=
                                                      "SPECIAL_NOTES")
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          e.name.toString(),
                                                          style: blackTextStyle
                                                              .copyWith(
                                                            fontSize: 12,
                                                            fontWeight: medium,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                        const SizedBox(
                                                            width: 14),
                                                        Builder(builder: (_) {
                                                          var valueText = "";

                                                          if (e.task2Result ==
                                                              null) {
                                                            valueText = "-";
                                                          } else {
                                                            dynamic element =
                                                                e.element;
                                                            if (element ==
                                                                    "input" ||
                                                                element ==
                                                                    "textarea") {
                                                              valueText = e
                                                                  .task2Result!
                                                                  .value
                                                                  .toString();
                                                              valueText =
                                                                  (valueText ==
                                                                          '0')
                                                                      ? '-'
                                                                      : valueText;
                                                            } else {
                                                              int parse = 0;
                                                              dynamic element =
                                                                  e.element;

                                                              try {
                                                                parse = int.tryParse(e
                                                                    .task2Result!
                                                                    .value
                                                                    .toString())!;

                                                                if (parse > 0) {
                                                                  element = element
                                                                      .split(
                                                                          ",");
                                                                  valueText =
                                                                      element[
                                                                          parse -
                                                                              1];
                                                                } else {
                                                                  valueText =
                                                                      '-';
                                                                }
                                                              } catch (e) {
                                                                parse = 0;
                                                                valueText = '-';
                                                              }
                                                            }
                                                          }

                                                          return Text(
                                                            valueText,
                                                            style:
                                                                blackTextStyle
                                                                    .copyWith(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  regular,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          );
                                                          // return Text(
                                                          //   valueText,
                                                          //   style: blackTextStyle
                                                          //       .copyWith(
                                                          //     fontSize: 12,
                                                          //     fontWeight: regular,
                                                          //   ),
                                                          //   overflow:
                                                          //       TextOverflow.ellipsis,
                                                          //   maxLines: 1,
                                                          // );
                                                        }),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          (e.task2Result!.value ==
                                                                      null ||
                                                                  e.task2Result!
                                                                          .value! ==
                                                                      '0')
                                                              ? '-'
                                                              : e.task2Result!
                                                                  .value!,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                            fontSize: 12,
                                                            fontWeight: regular,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList()
                          : [Container()],
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<TaskDocumentationCubit, TaskDocumentationState>(
                      builder: (_, state) => (state is TaskDocumentationSuccess)
                          ? ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              // height: MediaQuery.of(context).size.height,
                              child: GridView(
                                //Wrap(
                                // crossAxisCount: 2,
                                // shrinkWrap: true,
                                // mainAxisSpacing: 104,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 196,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                // alignment: WrapAlignment.spaceBetween,
                                // runAlignment: WrapAlignment.spaceBetween,
                                // crossAxisAlignment: WrapCro,
                                children: state.taskDocumentation
                                    .map((e) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DocumentationItemWidget(
                                              id: e.id!,
                                              taskId: e.taskId!,
                                              title: e
                                                  .taskDocumentationCategory!
                                                  .title!,
                                              // pictureUrl: e.path,
                                              onTapStatus: false,
                                            ),
                                            const SizedBox(height: 14),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            )
                          : Container(),
                    ),
                    (state.task.status == 1)
                        ? Column(
                            children: [
                              // const SizedBox(height: 14),
                              BlocConsumer<TaskExportSubmitCubit,
                                  TaskExportSubmitState>(
                                listener: (context, state) {
                                  isLoading = (state is TaskExportSubmitInitial)
                                      ? true
                                      : false;
                                },
                                builder: (context, state) {
                                  return ButtonWidget(
                                    height: 32,
                                    text: "Export",
                                    backgroundColor: kKiwiGreenColor,
                                    onPressed: () async {
                                      await context
                                          .read<TaskExportSubmitCubit>()
                                          .Store(taskId: taskId.toString());
                                      TaskExportSubmitState state = context
                                          .read<TaskExportSubmitCubit>()
                                          .state;

                                      if (state is TaskExportSubmitSuccess) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(state.message),
                                            backgroundColor: kKiwiGreenColor,
                                          ),
                                        );
                                      }
                                    },
                                    isLoading: isLoading,
                                  );
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                );
              } else {
                return const TaskShimmer();
              }
            },
          ),
        ),
      ],
    );
  }
}
