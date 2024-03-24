part of 'page.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // int next = 1;
    // int limit = 10;
    // List<Task> tasks;

    // PagingController<int, Task> pagingController =
    //     PagingController(firstPageKey: 1);

    void ApiFunction() {
      CheckSession(context);

      context.read<TaskCubit>().Fetch();
      // try {
      //   TaskState taskState = context.read<TaskCubit>().state;
      //   tasks = (taskState as TaskSuccess).task;

      //   bool isLastPage = tasks.length < limit;
      //   if (isLastPage) {
      //     pagingController.appendLastPage(tasks);
      //   } else {
      //     next = page + 1;
      //     pagingController.appendPage(tasks, next);
      //   }
      // } catch (e) {
      //   print("error --> $e");
      //   pagingController.error = e;
      // }
    }

    // pagingController.addPageRequestListener((pageKey) {
    //   ApiFunction(next);
    // });

    ApiFunction();

    return GeneralPage(
      title: 'OM AMR',
      centerTitle: true,
      backgroundColor: kWhiteColor,
      onBackButtonPressed: () {
        Get.back();
      },
      onRefresh: () async {
        ApiFunction();
      },
      // () => Future.sync(() => pagingController.refresh()),
      // body: PagedListView<int, Task>(
      //   pagingController: pagingController,
      //   builderDelegate: PagedChildBuilderDelegate<Task>(
      //     itemBuilder: (context, item, index) => Padding(
      //       padding: const EdgeInsets.all(15),
      //       child: Container(),
      //     ),
      //   ),
      // ),
      children: [
        BlocListener<TaskCubit, TaskState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (_, state) => (state is TaskSuccess)
                ? Column(
                    children: state.task
                        .map(
                          (e) => TaskItemWidget(
                            task: e,
                            showStatus: true,
                            onTap: () {
                              Get.to(
                                TaskDetailPage(
                                  companyId: (e.company!.id == null)
                                      ? 0
                                      : e.company!.id!,
                                  taskId: (e.id == null) ? 0 : e.id!,
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
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
      ],
    );
  }
}
