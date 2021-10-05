import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kg_students/Components/custom-card.dart';
import 'package:kg_students/Controllers/websites-list.dart';
import 'package:kg_students/Models/custom-card.dart';

class WebsitesScreen extends StatelessWidget {
  ControlWebsitesScreen _controlWebsitesScreen = ControlWebsitesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _controlWebsitesScreen.dataLength,
        itemBuilder: (context, index) {
          List<ListCard> _data = _controlWebsitesScreen.dataNews;
          ListCard snapshot = _data[index];
          return CustomColorCard(
            webTitle: snapshot.title,
            image: snapshot.image,
            pageurl: snapshot.url,
          );
        },
      ),
    );
  }
}
