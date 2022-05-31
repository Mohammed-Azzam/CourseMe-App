import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/modules/home/HomeCubit.dart';

import '../home/HomeStates.dart';

class CourseDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context)
        {
         return BlocConsumer<HomeCubit, HomeStates>(
           listener: (context, state){},
           builder: (context, state)
           {
             var bloc = HomeCubit.get(context);
             return Scaffold(
               appBar: AppBar(
                 backgroundColor: Color(0xFFECB7BF),
                 centerTitle: true,
                 title: Text(
                   "Course Detail",
                   style: TextStyle(
                       color: Colors.black,
                       fontFamily: "Playfair Display",
                       fontWeight: FontWeight.bold,
                       fontSize: 18),
                 ),
               ),
               body: SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 15, top: 20),
                       child: Text(
                         bloc.CoursesAllList.first.name.toString(),
                         style: TextStyle(
                             color: Colors.black,
                             fontFamily: "Playfair Display",
                             fontWeight: FontWeight.bold,
                             fontSize: 18),
                         textAlign: TextAlign.start,
                       ),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 15),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               Text(
                                 "By",
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontFamily: "Playfair Display",
                                     fontWeight: FontWeight.bold,
                                     fontSize: 13),
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Text(
                                 "Gilberto S. Osborne",
                                 style: TextStyle(
                                     color: Colors.grey,
                                     fontFamily: "Playfair Display",
                                     fontWeight: FontWeight.bold,
                                     fontSize: 13),
                               ),
                               SizedBox(
                                 width: 20,
                               ),
                               Text(
                                 "36 Reviews",
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontFamily: "Playfair Display",
                                     fontWeight: FontWeight.bold,
                                     fontSize: 13),
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Text(
                                 "(View All)",
                                 style: TextStyle(
                                     color: Color(0xFFC99200),
                                     fontFamily: "Playfair Display",
                                     fontWeight: FontWeight.bold,
                                     fontSize: 13),
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 5,
                           ),
                           Row(
                             children: [
                               Text(
                                 "Start On",
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontFamily: "Playfair Display",
                                     fontWeight: FontWeight.bold,
                                     fontSize: 13),
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Text(
                                 "05 Feb 2020",
                                 style: TextStyle(
                                     color: Colors.grey,
                                     fontFamily: "Playfair Display",
                                     fontWeight: FontWeight.bold,
                                     fontSize: 13),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 10, right: 10),
                                 child: Container(
                                   color: Colors.grey.withOpacity(0.7),
                                   height: 20,
                                   width: 1,
                                 ),
                               ),
                               Text(
                                 "27 Lessions",
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontFamily: "Playfair Display",
                                     fontWeight: FontWeight.bold,
                                     fontSize: 13),
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           Text(
                             "75.00 KWD",
                             style: TextStyle(
                                 color: Color(0xFFC99200),
                                 fontFamily: "Playfair Display",
                                 fontWeight: FontWeight.bold,
                                 fontSize: 26),
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           Text(
                             "About this Course",
                             style: TextStyle(
                                 color: Colors.black,
                                 fontFamily: "Playfair Display",
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Text(
                             "Relax and do whatever fits with your design process.\nDon’t set a lot of restrictive hard-and-fast rules. Use\nfiller text where it helps your design process, but use\nreal content if you’ve got it, as long as it doesn’t\ndistract and slow down your design process use real\ncontent where possible, and where it doesn’t create\ntoo much distraction. Read More...",
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontFamily: "Playfair Display",
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14),
                           ),
                           SizedBox(
                             height: 40,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 27),
                             child: Text(
                               "Courses",
                               style: TextStyle(
                                   color: Colors.black,
                                   fontFamily: "Playfair Display",
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18),
                             ),
                           ),
                           SizedBox(
                             height: 40,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 5),
                             child: Container(
                               height: 79,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                         color: Colors.grey.withOpacity(0.6),
                                         blurRadius: 20,
                                         offset: Offset(5,5,))
                                   ]),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 27),
                                 child: Row(
                                   children: [
                                     Text(
                                       "Lesson 01:",
                                       style: TextStyle(
                                           color: Color(0xFFC99200),
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                     Text(
                                       "Introduction",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontFamily: "Playfair Display",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14),
                                     ),
                                     SizedBox(
                                       width: 90,
                                     ),
                                     Container(
                                       child: Image.asset("assets/images/play.png"),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             );
           },
         );
        }

    );
  }
}
