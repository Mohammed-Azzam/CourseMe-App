import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final List<String> listName = ["Ahmed", "Mohammed", "Omer", "Camel", "Maria", "Abdullah", "Jamal", "mahmoud","Eid", "Ahmed", "Jamal", "mahmoud","Eid", "Ahmed"];
  final List<String> listNumber = ["0598644", "0598644", "05864851", "0597548", "05686348", "05864851", "05945945", "05686348", "05864851", "05945945", "05945945", "05686348", "05864851", "05945945"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "ListView",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            child: ListView.builder(
              itemBuilder: (_,int index) => ListViewItem(this.listName[index],this.listNumber[index],),
              itemCount: this.listName.length,
            ),
          ),
        ));
  }
}

class ListViewItem extends StatelessWidget {
  String listname;
  String listnumber;

  ListViewItem(
      this.listname,
      this.listnumber,
  );
  @override
  Widget build(BuildContext context) {
    return new Card(
      child:
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children:
              [
                Icon(Icons.person,color: Colors.black,),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listname,),
                    SizedBox(height: 5,),
                    Text(listnumber,style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10,),
                  ],
                ),

              ],
            ),
          ),
    );

  }
}
