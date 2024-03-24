part of 'page.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _title = "Home";

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ScanQrPage(),
    ScanQrPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _title = "Home";
          break;
        case 1:
          // modalBottomSheet(context, [Text('ASD')], true);
          _title = "Scan";
        case 2:
          _title = "AMR";
        case 3:
          _title = "Profile";
          break;
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    ApiFunction();

    return GeneralPage(
      scaffoldKey: _scaffoldKey,
      title: _title,
      centerTitle: true,
      backgroundColor: kWhiteColor,
      onRefresh: () async {
        ApiFunction();
      },
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/ic_baseline-dashboard.png"),
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/lucide_scan-line.png"),
              size: 24,
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/amr.png"),
              size: 20,
            ),
            label: 'AMR',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/mdi_user.png"),
              size: 24,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        //(_selectedIndex == 1) ? 2 : _selectedIndex,
        selectedItemColor: kBlackColor,
        unselectedItemColor: kGreyColor,
        onTap: _onItemTapped,
      ),
      children: [_widgetOptions.elementAt(_selectedIndex)],
    );
  }
}
