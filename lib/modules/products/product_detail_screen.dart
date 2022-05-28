// import 'package:flutter/material.dart';
// import 'all_courses_screen.dart';
//
// class Test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) => AllCoursesScreen(),
//       itemCount: 6,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_shop/component/component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../drawer/navigation_drawer.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        4,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                height: 290,
                child: Image.asset(
                  "assets/images/img.png",
                  fit: BoxFit.fill,
                ),
              ),
            ));
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
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
      ),
      endDrawer: NavigationDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: WormEffect(
                  dotColor: Color(0xFFecb7bf),
                  activeDotColor: Color(0xFFe59aa5),
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(
                      "The Earth Ceramic Coffee Mug",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Playfair Display",
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      "280 KWD",
                      style: TextStyle(
                          color: Color(0xFFC99200),
                          fontFamily: "Playfair Display",
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(

                      children:
                      [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 15,
                                    offset: Offset(5,5,))
                              ]),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.minimize,
                                  color: Colors.grey,
                                  size: 17,
                                ),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Playfair Display",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Expanded(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                      size: 20,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "About product",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Playfair Display",
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "It is a long established fact that a reader will be\ndistracted by the readable content of a page when\n looking at its layout.\nThe point of using Lorem Ipsum is that it has a more-\nor-less normal distribution of letters, as opposed to\nusing 'Content here, content here', making it look like\nreadable English.",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Playfair Display",
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(child: defaultButton4(text: "ADD TO CART", fun: (){})),
                    SizedBox(
                      height: 51,
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

//Row(
//                   children:
//                   [
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey.withOpacity(0.6),
//                                 blurRadius: 20,
//                                 offset: Offset(5,5,))
//                           ]
//                       ),
//                       width: 88,
//                       height: 30,
//                       child: Row(
//                         children:
//                         [
//                           IconButton(
//                             alignment: Alignment.center,
//                             onPressed: () {
//
//                             },
//                             icon: Padding(
//                               padding: const EdgeInsets.only(right: 5),
//                               child: Icon(
//                                 Icons.add,
//                                 size: 20,
//                                 color: Colors.grey[350],
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "0",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontFamily: "Playfair Display",
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14),
//                           ),
//                           // SizedBox(width: 8),
//                           IconButton(
//                             alignment: Alignment.center,
//                             onPressed: () {
//
//                             },
//                             icon: Padding(
//                               padding: const EdgeInsets.only(right: 5),
//                               child: Icon(
//                                 Icons.minimize_outlined,
//                                 color: Colors.grey[350],
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       )
//                     ),
//                   ],
//                 ),
final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
