import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kg_students/Components/custom-color-button.dart';
import 'package:kg_students/Components/custom-color-image.dart';
import 'package:kg_students/Components/hint-text.dart';
import 'package:kg_students/Controllers/colors-list.dart';
import 'package:kg_students/Models/cutom-colors.dart';

//! Colors screen

class ColorLearn extends StatefulWidget {
  @override
  _ColorLearnState createState() => _ColorLearnState();
}

class _ColorLearnState extends State<ColorLearn> {
  String _image = "assets/Images/Colours.png";
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  ColorData _colorData = ColorData();
  List<CustomColor> _data = [];

  //! refresh the screen to dispaly picture of color selected and play its name sound
  void buttonAction(int index) async {
    // control audio
    audioCache.clearAll();
    audioPlayer.stop();
    audioPlayer = await audioCache.play(_data[index].bColorVoice);
    // change image path and rebuild the widget
    setState(() {
      _image = _data[index].bColorImage;
    });
  }

  @override
  void initState() {
    super.initState();
    _data = _colorData.colorsData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //hint
            hintText(hint: "Click on color name then listen and watch :"),
            // _image container
            Container(
              child: customImage(image: _image),
              height: 220,
            ),
            Expanded(
              //! generate colors buttons in grid view
              child: GridView.builder(
                itemCount: _colorData.countColors,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (buildContext, index) {
                  return CustomColorButton(
                    color: _data[index].bColor,
                    title: _data[index].bColorTitle,
                    cImage: _data[index].bColorImage,
                    cVoice: _data[index].bColorVoice,
                    titleColor: _data[index].titleColor,
                    onClick: () {
                      buttonAction(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
