import 'package:flutter/material.dart';
import '../drawer/navigation_drawer.dart';
import 'my_courses_screen.dart';

class CoursesScreen extends StatefulWidget {
  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
        title: Text("Courses",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Playfair Display",
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        elevation: 0.0,
        backgroundColor: Color(0xFFECB7BF),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Icon(
            Icons.search,
          ),
        ),
      ),
      endDrawer: NavigationDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white10,
            ),
            height: 53,
            width: MediaQuery.of(context).size.height,
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Color(0xFFC99200),
              controller: tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xFFF2F2F2),
              ),
              tabs: [
                Tab(
                  text: "ALL COURSES",
                ),
                Tab(
                  text: "MY COURSES",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: TabBarView(
              children: [
                Container(
                    child: ListView.builder(
                  itemBuilder: (context, index) => AllCoursesScreen(),
                  itemCount: 6,
                )),
                Container(
                    child: ListView.builder(
                  itemBuilder: (context, index) => MyCoursesScreen(),
                  itemCount: 3,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AllCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 20,
                      offset: Offset(
                        0,
                        3,
                      ))
                ]),
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(
                        "assets/images/computer.png",
                      ),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Business Management",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Playfair Display",
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(
                            "By",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Playfair Display",
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Text(
                            " Betty R. Roberts",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Playfair Display",
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      Text(
                        "14 Lessons",
                        style: TextStyle(
                            color: Color(0xFFC99200),
                            fontFamily: "Playfair Display",
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// abstract class ThemeText {
//    Color color1 =
//   static const TextStyle progressHeader = TextStyle(
//       fontFamily: 'Playfair Display',
//       color: color1,
//       fontSize: 14,
//       fontWeight: FontWeight.bold);
// }
