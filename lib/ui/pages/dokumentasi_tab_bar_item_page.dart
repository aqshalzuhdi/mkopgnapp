part of 'page.dart';

class DokumentasiTabBarItemPage extends StatelessWidget {
  final int taskId;
  const DokumentasiTabBarItemPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    // bool isLoading = false;
    // String imgBase64 = "";

    // final ImagePicker picker = ImagePicker();
    // File? pictureFile;

    // TextEditingController _titleController = TextEditingController();

    // context.read<TaskDocumentationCategoryCubit>().Fetch();
    context.read<TaskDocumentationCubit>().Fetch(taskId);
    return BlocBuilder<TaskDocumentationCubit, TaskDocumentationState>(
      builder: (_, state) {
        return (state is TaskDocumentationSuccess)
            ? Builder(
                builder: (context) {
                  return Wrap(
                    spacing: 24,
                    // runSpacing: 14,
                    children: state.taskDocumentation
                        .map(
                          (e) => DocumentationItemWidget(
                            id: e.id!,
                            taskId: taskId,
                            title:
                                e.taskDocumentationCategory!.title.toString(),
                            // pictureUrl: e.path,
                          ),
                        )
                        .toList(),
                  );
                },
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(_).size.height * 0.15),
                  SpinKitThreeBounce(
                    color: kKiwiGreenColor,
                    size: 18,
                  ),
                ],
              );
        // const Wrap(
        //     spacing: 14,
        //     runSpacing: 14,
        //     children: [
        //       DocumentationShimmer(),
        //       DocumentationShimmer(),
        //       DocumentationShimmer(),
        //       DocumentationShimmer(),
        //       DocumentationShimmer(),
        //       DocumentationShimmer(),
        //     ],
        //   );
      },
    );
  }
}
