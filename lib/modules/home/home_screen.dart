import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop/component/component.dart';
import 'package:my_shop/models/course_model.dart';
import 'package:my_shop/modules/drawer/navigation_drawer.dart';
import 'package:my_shop/modules/home/HomeCubit.dart';
import 'package:my_shop/modules/home/HomeStates.dart';
import 'package:http/http.dart' as http;
import '../../styles/color.dart';
import '../courses/all_courses_screen.dart';
import '../courses/my_courses_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   CourseModel? carusalModel;

  getDataCourse() async {
    CollectionReference courref = FirebaseFirestore.instance.collection('course');
    QuerySnapshot querySnapshot = await courref.get();

    List<QueryDocumentSnapshot> listdocs = querySnapshot.docs;

    listdocs.forEach((element) {
      print(element.data());
      print("=============================");

    });
  }

  @override
  void initState() {
    getDataCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CourseModel? courseModel;
            return Scaffold(
              appBar: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.0),
                  ),
                ),
                title: Text("Home",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Playfair Display",
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                elevation: 0.0,
                backgroundColor: Color(0xFFECB7BF),
                centerTitle: true,
                leading: IconButton(
                  // color: Colors.black,
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(
                    Icons.search,
                    // color: Colors.black,
                  ),
                ),
              ),
              // endDrawer: Drawer(
              //   backgroundColor: Colors.white,
              //   child: ListView(
              //         children:
              //         [
              //           SizedBox(height: 100,),
              //           buildMenuItem(
              //               text: "Home",
              //               icon: Icons.home
              //           )
              //         ]
              //     ),
              // ),
              endDrawer: NavigationDrawer(),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "Checkout Our Demos",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Playfair Display",
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        child: CarouselSlider(
                          items: [
                            Stack(
                              children:
                              [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                     child:  Text('${courseModel?.category}')
                                ),
                                ClipRRect(
                                  child: Image.network(
                                    '${courseModel?.image}',fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            )
                          ].toList(),
                          options: CarouselOptions(
                              height: 200,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              viewportFraction: .8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Text(
                                "Our Free Courses",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Playfair Display",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              width: 212,
                            ),
                            IconButton(
                                onPressed: () {
                                  navigatorToAll(context, AllCoursesScreen());
                                },
                                icon: Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => buildFreeCourses(),
                            itemCount: 3),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Our Paid Courses",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Playfair Display",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 212,
                            ),
                            IconButton(
                                onPressed: () {
                                  navigatorToAll(context, MyCoursesScreen());
                                },
                                icon: Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => buildPaidCourses(),
                            itemCount: 3),
                      ),
                    ]),
              ),
            );
          },
        );
      },
    );
  }
}

@override
Widget buildFreeCourses() => Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 10)],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/pincle.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 90,
                  left: 30,
                  child: Text(
                    "Social Media\nMarketing",
                    style: TextStyle(
                        color: Color(0xFFC99200),
                        fontFamily: "Playfair Display",
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

Widget buildPaidCourses() => Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 5)],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/computer.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 90,
                  left: 30,
                  child: Text(
                    "Arts and\nHumanities",
                    style: TextStyle(
                        color: Color(0xFFC99200),
                        fontFamily: "Playfair Display",
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

// data_backend/lib/firestore/services.dart -- line ~13
// class HttpServices implements Services {
//   Client client = new Client();
//
//   Future<List<Todo>> getTodos() async {
//     final response = await client.get('https://jsonplaceholder.typicode.com/todos');
//
//     if (response.statusCode == 200) {
//       var all =  AllTodos.fromJson(json.decode(response.body));
//       return all.todos;
//     } else {
//       throw Exception('Failed to load todos ');
//     }
//   }
// }
