part of 'page.dart';

class CompanyAvailablePage extends StatelessWidget {
  const CompanyAvailablePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CompanyCubit>().FetchAvailable();
    return GeneralPage(
      title: 'Buat OM AMR',
      centerTitle: true,
      backgroundColor: kWhiteColor,
      onRefresh: () async {
        context.read<CompanyCubit>().FetchAvailable();
      },
      onBackButtonPressed: () {
        context.read<TaskCubit>().Fetch();
        Get.back();
      },
      children: [
        BlocBuilder<CompanyCubit, CompanyState>(
          builder: (_, state) => (state is CompanySuccess)
              ? Column(
                  children: state.company
                      .map(
                        (e) => CompanyItemWidget(
                          company: e,
                          onTap: () {
                            modalBottomSheet(
                              context,
                              [],
                              true,
                            );
                          },
                        ),
                      )
                      .toList(),
                )
              : TaskShimmer(),
        )
      ],
    );
  }
}
