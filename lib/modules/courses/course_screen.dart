import 'package:flutter/material.dart';
import '../../models/course_model.dart';
import '../drawer/navigation_drawer.dart';
import '../home/HomeCubit.dart';
import 'my_courses_screen.dart';

class CoursesScreen extends StatefulWidget {
  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  // @override
  // void initState() {
  //   tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   tabController!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var bloc = HomeCubit.get(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 25,
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
                    Tab(text: "ALL COURSES"),
                    Tab(text: "MY COURSES"),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight,
                child: TabBarView(
                  children: [
                    Container(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => AllCoursesScreen(
                            bloc.CoursesAllList.elementAt(index)),
                        itemCount: bloc.CoursesAllList.length,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemBuilder: (context, index) => MyCoursesScreen(),
                        itemCount: bloc.CoursesAllList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget AllCoursesScreen([CourseModel? model]) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 20,
                offset: Offset(
                  5,
                  5,
                )),
          ]),
      height: 84,
      width: 345,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 7, right: 12, top: 7 ,bottom: 7),
            child: Container(
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  model!.image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 15, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Playfair Display",
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      "By ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Playfair Display",
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      model.teacher_By.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Playfair Display",
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),

                  ],
                ),
                Text(
                  '${model.numberOfLessons.toString()} Lessons',
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
  );
}
// abstract class ThemeText {
//    Color color1 =
//   static const TextStyle progressHeader = TextStyle(
//       fontFamily: 'Playfair Display',
//       color: color1,
//       fontSize: 14,
//       fontWeight: FontWeight.bold);
// }
