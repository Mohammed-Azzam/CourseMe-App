import 'package:flutter/material.dart';
import 'package:my_shop/component/component.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Playfair Display",
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        elevation: 0.0,
        backgroundColor: Color(0xFFECB7BF),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(1, 20,),),
                  ]),
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(
                          "assets/images/cupe.png",
                        ),
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "The Earth Ceramic Coffee\nMug",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Playfair Display",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(width: 31,),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_outline,
                                  size: 30,
                                  color: Color(0xFFECB7BF),
                                ),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10,bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "280 KWD",
                                style: TextStyle(
                                    color: Color(0xFFC99200),
                                    fontFamily: "Playfair Display",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(width: 65,),
                              Container(
                                height: 32,
                                width: 102.5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),

                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 15,
                                            offset: Offset(
                                              5,
                                              5,
                                            ))
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
                                        "2",
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
                                            ),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Container(
                              //   height: 30,
                              //   width: 100,
                              //   decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.circular(20),
                              //       boxShadow: [
                              //         BoxShadow(
                              //             color: Colors.grey.withOpacity(0.4),
                              //             blurRadius: 15,
                              //             offset: Offset(5,5,))
                              //       ]),
                              //   child: Row(
                              //     children: [
                              //       IconButton(
                              //         onPressed: () {},
                              //         icon: Icon(
                              //           Icons.minimize,
                              //           color: Colors.grey,
                              //           size: 17,
                              //         ),
                              //       ),
                              //       Text(
                              //         "2",
                              //         style: TextStyle(
                              //             color: Colors.black,
                              //             fontFamily: "Playfair Display",
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 14),
                              //       ),
                              //       Expanded(
                              //         child: IconButton(
                              //             onPressed: () {},
                              //             icon: Icon(
                              //               Icons.add,
                              //               color: Colors.grey,
                              //               size: 20,
                              //             )),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children:
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub total:",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Playfair Display",
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Tax (15%):",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Playfair Display",
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(width: 296,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "100 KWD",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Playfair Display",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "15 KWD",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Playfair Display",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 11,),
            Container(color: Colors.grey.withOpacity(0.1),height: 1,width: double.infinity,),
            SizedBox(height: 11,),
            Row(
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Playfair Display",
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(width: 242,),
                Text(
                  "215 KWD",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Playfair Display",
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Divider(),
            SizedBox(height: 25,),
            defaultButton4(text: "CHECKOUT", fun: (){})
          ],
        ),
      ),
    );
  }
}
