import 'package:achievex/screens/brain_games/Meditation/theme.dart';
import 'package:achievex/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class MeditationLanding extends StatefulWidget{

  @override
  _MeditationLandingState createState() => _MeditationLandingState();
}

class _MeditationLandingState extends State<MeditationLanding> {
  var mediimg;
  var meditext;
  var medisinger;

  bool check = false;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: MeditationTheme.MedTheme,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () => {Navigator.pop(context)},
                          child: const Padding(
                            padding: EdgeInsets.only(top: 45.0),
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 70.0),
                          child: Text(
                            'Meditation',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              // fontFamily: 'Prompt-Bold',
                              fontSize: 38,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/images/med.png',
                              height: 100,
                            )),
                      ],
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _TextBar(context, height, width, "Meditation Playlist",
                            true),
                        _PlayCard(height, width, "meditation1", "meditation-1",
                            "singer-1"),
                        _PlayCard(height, width, "meditation1", "meditation-1",
                            "singer-1"),
                        _PlayCard(height, width, "meditation1", "meditation-1",
                            "singer-1"),
                        _PlayCard(height, width, "meditation1", "meditation-1",
                            "singer-1"),
                        _TextBar(context, height, width, "Alpha Waves", false),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _BottomBox(height, width),
                              _BottomBox(height, width),
                              _BottomBox(height, width),
                              _BottomBox(height, width),
                              _BottomBox(height, width),
                              _BottomBox(height, width),
                              _BottomBox(height, width),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 50),
                ],
              ),
              Positioned(
                top: height * 0.95,
                child: _Player(height, width, "meditation1", "meditation1", "singer1". Icons.play_arrow),
                // child: Icon(
                //   Icons.star,
                //   color: Colors.yellow,
                //   size: 30,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//the widget for showing the currently playing song or the audio

Widget _Player(var height, var width, var img, var title, var singer, IconData icon) {
  return Container(
    height: height * 0.11,
    width: width,
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: HexColor('#D8DEFF'),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Image.asset(
              "assets/images/${img}.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 200,
          width: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Center(
                    child: Text(
                      singer,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        Icon(
            icon,
            color: Colors.white,
          ),
        
      ],
    ),
  );
}

// the widget for the bottom showbar of the alpha waves...

Widget _BottomBox(var height, var width) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: height * 0.2,
      width: width * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          "assets/images/medi-poster.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

// the widget for showing the music playlist bar

Widget _PlayCard(var height, var width, var img, var title, var singer) {
  return InkWell(
    onTap: () {},
    child: Container(
      height: height * 0.1,
      width: width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: HexColor('#D8DEFF'),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/${img}.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 200,
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Center(
                        child: Text(
                          singer,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ]),
    ),
  );
}

// the textbar to show the title for the particular section

Widget _TextBar(context, var height, var width, var text, bool check) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 6.0, bottom: 6.0),
    child: Container(
      height: height * 0.1,
      width: width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
            check
                ? Container(
                    height: height * 0.04,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Show All",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(height: 0, width: 0),
          ]),
    ),
  );
}
