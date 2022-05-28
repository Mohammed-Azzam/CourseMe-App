import 'package:flutter/material.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        offset: Offset(0,3,))
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
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
// class ItemWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//
//
//
//
//         // Column(
//         //   children:
//         //   [
//         //     Text("Business Management"),
//         //     Row(
//         //       children:
//         //       [
//         //         Text("Business Management"),
//         //         Text("Business Management")
//         //       ],
//         //     )
//         //   ],),
//       ),
//     );
//   }
// }
