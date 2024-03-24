part of 'page.dart';

class OMFormTabBarItemPage extends StatelessWidget {
  final int categoryId;
  final int taskId;
  const OMFormTabBarItemPage({
    super.key,
    required this.categoryId,
    required this.taskId,
  });

  void changeOption(RadioButtonOption? newValue, BuildContext context) {
    if (newValue != null) {
      context.read<RadioCubit>().changeOption(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<TaskCategorySubCubit>().Fetch(categoryId);
    return BlocBuilder<TaskCategorySubCubit, TaskCategorySubState>(
      builder: (_, state) {
        return (state is TaskCategorySubSuccess)
            ? Container(
                // MediaQuery.of(context).size.height * .40,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                child: CardWidget(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.taskCategorySub.map((e) {
                      Widget r = Container();
                      if (e.element![0] == "input") {
                        r = _textForm(
                          context,
                          label: e.name!,
                          taskId: taskId.toString(),
                          taskDetailId: e.id.toString(),
                        );
                      } else if (e.element![0] == "textarea") {
                        r = _textareaForm(
                          context,
                          label: e.name!,
                          taskId: taskId.toString(),
                          taskDetailId: e.id.toString(),
                        );
                      } else {
                        r = _radioButtonForm(context,
                            label: e.name!,
                            radioText: e.element!,
                            radioButtonOption: e.element!
                                .asMap()
                                .entries
                                .map((e) => radioButtonOption(e.key + 1))
                                .toList(),
                            taskId: taskId.toString(),
                            taskDetailId: e.id.toString(),
                            radioValue: e.element!
                                .asMap()
                                .entries
                                .map((e) => e.key + 1)
                                .toList());
                      }

                      return r;
                    }).toList(),
                  ),
                ),
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
      },
    );
  }

  Widget _textareaForm(
    BuildContext ctx, {
    required String label,
    required String taskId,
    required String taskDetailId,
  }) {
    TextEditingController textController = TextEditingController();
    bool isLoading = false;
    return Column(
      children: [
        SizedBox(
          // width: MediaQuery.of(context).size.height * .20,
          child: TextfieldKeyboardTypeWidget(
            label: label,
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            controller: textController,
          ),
        ),
        const SizedBox(height: 14),
        BlocConsumer<TaskResultSubmitCubit, TaskResultSubmitState>(
          listener: (context, state) {
            isLoading = (state is TaskResultSubmitInitial) ? true : false;
          },
          builder: (context, state) {
            return ButtonWidget(
              height: 32,
              backgroundColor: kKiwiGreenColor,
              text: "Simpan",
              onPressed: () async {
                // print("submit: ${formatParam(0)}");
                // await context.read<TaskResultSubmitCubit>().Store(
                //       taskId: taskId.toString(),
                //       taskDetailId: "25",
                //       value: _catatanKhususController.text,
                //     );
                submitTaskResult(
                  ctx,
                  taskId,
                  taskDetailId,
                  textController.text,
                );
              },
              isLoading: isLoading,
            );
          },
        ),
      ],
    );
  }

  Widget _textForm(
    BuildContext ctx, {
    required String label,
    required String taskId,
    required String taskDetailId,
  }) {
    return Column(
      children: [
        // Row(
        //   children: [
        SizedBox(
          // width: MediaQuery.of(ctx).size.width * .64,
          child: TextfieldWidget(
            label: label,
            obsecureText: false,
            // controller: _nilaiSparePrimaryController,
            onSubmitted: (text) {
              submitTaskResult(
                ctx,
                taskId,
                taskDetailId,
                text,
              );
            },
          ),
        ),
        // const SizedBox(width: 8),
        // ButtonWidget(
        //   width: MediaQuery.of(ctx).size.width * .12,
        //   onPressed: () {},
        //   isLoading: false,
        // ),
        //   ],
        // ),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _radioButtonForm(
    BuildContext ctx, {
    required String label,
    required List<dynamic> radioText,
    required List<RadioButtonOption> radioButtonOption,
    required String taskId,
    required String taskDetailId,
    required List<dynamic> radioValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(ctx).size.width / 2,
          child: Text(
            label,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        BlocProvider(
          create: (_) => RadioCubit(RadioButtonOption.NotSelectedOption),
          child: BlocBuilder<RadioCubit, RadioButtonOption>(
            builder: (context, state) {
              return Row(
                // direction: Axis.horizontal,
                // runSpacing: 2,
                // spacing: 1,
                children: radioButtonOption
                    .map((e) => Row(
                          children: [
                            RadioWidget(
                              title: radioText[e.index - 1].toString(),
                              value: e,
                              groupValue: state,
                              onChanged: (value) {
                                changeOption(value, context);
                                submitTaskResult(
                                  context,
                                  taskId.toString(),
                                  taskDetailId,
                                  radioValue[e.index - 1].toString(),
                                );
                              },
                            ),
                            const SizedBox(width: 24),
                          ],
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
