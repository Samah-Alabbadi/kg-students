import 'package:flutter/material.dart';
import 'package:kg_students/Components/change-image-button.dart';
import 'package:kg_students/Components/hint-text.dart';
import 'package:kg_students/Controllers/images-list.dart';
import 'package:kg_students/Components/button-alphabet.dart';
import 'package:kg_students/Models/custom-alphabet.dart';
import 'package:audioplayers/audioplayers.dart';

import 'dart:math';

class AlphabetPage extends StatefulWidget {
  @override
  _AlphabetPageState createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {
  //! variables
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  String _image = "assets/Images/abc2.jpg";
  String _startButton = 'Click to Start';
  List<CustomAlphabet> _imlist = ImagesList().imagesURL;
  //!random number generator
  var _r = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              //! change image button
              changeImageButton(
                  startButton: _startButton, changePic: () => changePic()),
              //! image
              Container(height: 210, child: Image.asset(_image)),
              Divider(
                thickness: 5,
              ),

              //! hint text
              hintText(hint: 'Click on the sutable alphabet for the picture:'),
              //! generate 26 button of english alphabites
              Expanded(
                child: GridView.builder(
                  itemCount: ImagesList().countImages,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemBuilder: (buildContext, index) {
                    return CustomAlphaButton(
                      title: _imlist[index].title,
                      index: index,
                      onClick: () => buttonAction(index),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//! change the picture in image
  void changePic() {
    _r = new List.generate(
        1, (index) => new Random().nextInt((ImagesList().countImages)));
    if (_startButton != "Next Picture") {
      _startButton = "Next picture";
      print(' ,${_r[0]}');
    }
    setState(() {
      _image = _imlist[_r[0]].image;
    });
  }

//! check if the answer clicked is true or flse
  void buttonAction(int bIndex) async {
    audioCache.clearAll();
    audioPlayer.stop();
    if (bIndex == _r[0]) {
      audioPlayer = await audioCache.play("Audios/cheering.mp3");
    } else {
      audioPlayer = await audioCache.play("Audios/try.mp3");
    }
  }
}
