import 'package:flutter/material.dart';
import 'package:kg_students/Components/card-image.dart';
import 'package:kg_students/Components/card-title.dart';
import 'package:kg_students/Components/web-view.dart';

//! custom card for websites screen
class CustomColorCard extends StatelessWidget {
  // card feilds
  final String webTitle;
  final String image;
  final String pageurl;

  //constructor
  CustomColorCard(
      {Key? key,
      required this.webTitle,
      required this.image,
      required this.pageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //web view for the card
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppView(title: webTitle, url: pageurl),
            ));
      },
//card
      child: Container(
        //color: Colors.grey,
        margin: EdgeInsets.only(bottom: 8, left: 5, right: 5),
        height: 110,
        child: Card(
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              // card image
              cardImage(image: image),
              // card title
              cardTitle(webTitle: webTitle),
            ],
          ),
        ),
      ),
    );
  }
}
