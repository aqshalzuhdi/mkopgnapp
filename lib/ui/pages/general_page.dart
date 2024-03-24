part of 'page.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? appBarActions;
  final VoidCallback? onBackButtonPressed;
  final Widget? body;
  final List<Widget>? children;
  final RefreshCallback? onRefresh;
  final Widget? child;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final BottomNavigationBar? bottomNavigationBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const GeneralPage({
    super.key,
    this.scaffoldKey,
    this.title = "Title",
    this.centerTitle = false,
    this.appBarActions,
    this.onBackButtonPressed,
    this.body,
    this.children,
    this.onRefresh,
    this.child,
    this.floatingActionButton,
    this.backgroundColor,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: centerTitle,
        foregroundColor: kBlackColor,
        title: Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
        elevation: 0.5,
        leading: onBackButtonPressed != null
            ? Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: onBackButtonPressed,
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              )
            : Container(),
        actions: appBarActions,
        backgroundColor: kWhiteColor,
      ),
      body: body ??
          Stack(
            children: [
              SafeArea(
                child: Container(
                  color: backgroundColor ?? kLightBackgroundColor,
                ),
              ),
              SafeArea(
                child: RefreshIndicator(
                  onRefresh: onRefresh ??
                      () async {
                        // return null;
                        // return await Future<void>.delayed(
                        //     const Duration(milliseconds: 0));
                      },
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultEdgeInsets,
                      horizontal: defaultEdgeInsets,
                    ),
                    children: children ?? [],
                  ),
                ),
              ),
              child ?? Container()
            ],
          ),
      floatingActionButton: floatingActionButton ?? null,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
