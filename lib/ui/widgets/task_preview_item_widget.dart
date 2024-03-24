part of 'widget.dart';

class TaskPreviewItemWidget extends StatelessWidget {
  // final int taskId;
  // final int taskCategoryId;
  final int id;
  const TaskPreviewItemWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<TaskResultDetailCubit>().FetchById(id);

    return BlocListener<TaskResultDetailCubit, TaskResultDetailState>(
      listener: (context, state) {},
      child: BlocBuilder<TaskResultDetailCubit, TaskResultDetailState>(
        builder: (_, state) => (state is TaskResultDetailSuccess)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        state.taskResult.taskDetail!.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          state.taskResult.valueText!,
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        // SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              )
            : const Column(),
      ),
    );
  }
}
