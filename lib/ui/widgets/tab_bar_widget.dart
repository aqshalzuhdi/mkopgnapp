// part of 'widget.dart';

// class TabBarWidget extends StatefulWidget {
//   const TabBarWidget({super.key});

//   @override
//   State<TabBarWidget> createState() => _TabBarWidgetState();
// }

// class _TabBarWidgetState extends State<TabBarWidget>
//     with SingleTickerProviderStateMixin {
//   TabController? tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: Colors.white,
//           child: Expanded(
//             child: TabBar(
//               controller: tabController,
//               labelColor: Colors.amber,
//               unselectedLabelColor: Colors.black,
//               indicatorColor: Colors.amber,
//               indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
//               labelStyle: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'Roboto',
//               ),
//               tabs: [
//                 Tab(
//                   child: Text('About'),
//                 ),
//                 Tab(
//                   child: Text("Training"),
//                 ),
//                 Tab(
//                   child: Text("What's New"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Container(
//           child: Expanded(
//             child: TabBarView(
//               controller: tabController,
//               children: [
//                 Text('asd'),
//                 Text('asd1'),
//                 Text('asd2'),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
