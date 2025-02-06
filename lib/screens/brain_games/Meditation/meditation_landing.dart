import 'package:achievex/screens/brain_games/Meditation/meditation_player.dart';
import 'package:achievex/screens/brain_games/Meditation/player.dart';
import 'package:achievex/screens/brain_games/Meditation/theme.dart';
import 'package:achievex/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// all the global variables ...

late String mediimg = "meditation1";
late String meditext = "meditation-1";
late String medisinger = "Singer-1";
late IconData temp = Icons.play_arrow;
late int _index = 0;
late int _index_1 = 0;
late String suffix = "png";
late bool check1 = false;
late bool check2 = false;
late bool _index_check = true;

late IconData _icon = Icons.play_arrow;

// audio files that are required for this ....

List<dynamic> _Mediationplaylist = [
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132404/ebook/mindet_s3phlu.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132445/ebook/atomichabits_kwtxg7.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132445/ebook/atomichabits_kwtxg7.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132445/ebook/atomichabits_kwtxg7.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
];

List<dynamic> AlphaWaves = [
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132404/ebook/mindet_s3phlu.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132445/ebook/atomichabits_kwtxg7.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
];

List<dynamic> _MedititleList = [
  "Meditation-1",
  "Meditation-2",
  "Meditation-3",
  "Meditation-4",
  "Meditation-5",
  "Meditation-6",
  "Meditation-7",
  "Meditation-8",
  "Meditation-9",
  "Meditation-10",
  "Meditation-11",
  "Meditation-12",
  "Meditation-13",
];

List<String> _MedisubtitleList = [
  "Singer-1",
  "Singer-2",
  "Singer-3",
  "Singer-4",
  "Singer-5",
  "Singer-6",
  "Singer-7",
  "Singer-8",
  "Singer-9",
  "Singer-10",
  "Singer-11",
  "Singer-12",
  "Singer-13",
];

List<String> _AlphasubtitleList = [
  "Singer-1",
  "Singer-2",
  "Singer-3",
  "Singer-4",
  "Singer-5",
  "Singer-6",
  "Singer-7",
];

// list variables ..
late List<dynamic> _audiolist = _Mediationplaylist;
late List<String> _subtitlelist = _MedisubtitleList;

class MeditationLanding extends StatefulWidget {
  @override
  _MeditationLandingState createState() => _MeditationLandingState();
}

class _MeditationLandingState extends State<MeditationLanding> {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _TextBar(context, height, width,
                                "Meditation Playlist", true),
                            InkWell(
                              
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Container(
                                          decoration: BoxDecoration(
                                               color: Colors.black,
                                               borderRadius: BorderRadius.circular(20.0),


                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-1";
                                                    medisinger = "singer-1";
                                                    _index = 0;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                    check1
                                                        ? print("clicked!")
                                                        : print(
                                                            "not clicked !");
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-1",
                                                    "singer-1"),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-2";
                                                    medisinger = "singer-2";
                                                    _index = 1;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-2",
                                                    "singer-2"),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-3";
                                                    medisinger = "singer-3";
                                                    _index = 3;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-3",
                                                    "singer-3"),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-4";
                                                    medisinger = "singer-4";
                                                    _index = 4;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-4",
                                                    "singer-4"),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-5";
                                                    medisinger = "singer-5";
                                                    _index = 5;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-5",
                                                    "singer-5"),
                                              ),

                                               InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-6";
                                                    medisinger = "singer-6";
                                                    _index = 6;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-6",
                                                    "singer-6"),
                                              ),

                                               InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-7";
                                                    medisinger = "singer-7";
                                                    _index = 7;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-7",
                                                    "singer-7"),
                                              ),

                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-8";
                                                    medisinger = "singer-8";
                                                    _index = 8;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-8",
                                                    "singer-8"),
                                              ),

                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-9";
                                                    medisinger = "singer-9";
                                                    _index = 9;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-9",
                                                    "singer-9"),
                                              ),


                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-10";
                                                    medisinger = "singer-10";
                                                    _index = 10;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-10",
                                                    "singer-10"),
                                              ),

                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-11";
                                                    medisinger = "singer-11";
                                                    _index = 11;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-11",
                                                    "singer-11"),
                                              ),

                                              
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-12";
                                                    medisinger = "singer-12";
                                                    _index = 12;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-12",
                                                    "singer-12"),
                                              ),


                                                
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    check1 = true;
                                                    mediimg = "meditation1";
                                                    meditext = "meditation-13";
                                                    medisinger = "singer-13";
                                                    _index = 13;
                                                    suffix = "png";
                                                    _index_check = true;
                                                    _audiolist =
                                                        _Mediationplaylist;
                                                    _subtitlelist =
                                                        _MedisubtitleList;
                                                  });
                                                },
                                                child: _PlayCard(
                                                    height,
                                                    width,
                                                    "meditation1",
                                                    "meditation-13",
                                                    "singer-13"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: height * 0.04,
                                width: width * 0.15,
                                decoration: BoxDecoration(
                                  // color: Colors.transparent,
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
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              check1 = true;
                              mediimg = "meditation1";
                              meditext = "meditation-1";
                              medisinger = "singer-1";
                              _index = 0;
                              suffix = "png";
                              _index_check = true;
                              _audiolist = _Mediationplaylist;
                              _subtitlelist = _MedisubtitleList;
                              check1
                                  ? print("clicked!")
                                  : print("not clicked !");
                            });
                          },
                          child: _PlayCard(height, width, "meditation1",
                              "meditation-1", "singer-1"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              check1 = true;
                              mediimg = "meditation1";
                              meditext = "meditation-2";
                              medisinger = "singer-2";
                              _index = 1;
                              suffix = "png";
                              _index_check = true;
                              _audiolist = _Mediationplaylist;
                              _subtitlelist = _MedisubtitleList;
                            });
                          },
                          child: _PlayCard(height, width, "meditation1",
                              "meditation-2", "singer-2"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              check1 = true;
                              mediimg = "meditation1";
                              meditext = "meditation-3";
                              medisinger = "singer-3";
                              _index = 3;
                              suffix = "png";
                              _index_check = true;
                              _audiolist = _Mediationplaylist;
                              _subtitlelist = _MedisubtitleList;
                            });
                          },
                          child: _PlayCard(height, width, "meditation1",
                              "meditation-3", "singer-3"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              check1 = true;
                              mediimg = "meditation1";
                              meditext = "meditation-4";
                              medisinger = "singer-4";
                              _index = 4;
                              suffix = "png";
                              _index_check = true;
                              _audiolist = _Mediationplaylist;
                              _subtitlelist = _MedisubtitleList;
                            });
                          },
                          child: _PlayCard(height, width, "meditation1",
                              "meditation-4", "singer-4"),
                        ),
                        _TextBar(context, height, width, "Alpha Waves", false),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      check1 = true;
                                      mediimg = "medi-poster";
                                      meditext = "Alpha-1";
                                      medisinger = "singer-1";
                                      _index_1 = 0;
                                      suffix = "jpg";
                                      _index_check = false;
                                      _audiolist = AlphaWaves;
                                      _subtitlelist = _AlphasubtitleList;
                                    });
                                  },
                                  child: _BottomBox(height, width, 0)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      check1 = true;
                                      mediimg = "medi-poster";
                                      meditext = "Alpha-2";
                                      medisinger = "singer-2";
                                      _index_1 = 1;
                                      suffix = "jpg";
                                      _index_check = false;
                                      _audiolist = AlphaWaves;
                                      _subtitlelist = _AlphasubtitleList;
                                    });
                                  },
                                  child: _BottomBox(height, width, 1)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      check1 = true;
                                      mediimg = "medi-poster";
                                      meditext = "Alpha-3";
                                      medisinger = "singer-3";
                                      _index_1 = 2;
                                      suffix = "jpg";
                                      _index_check = false;
                                      _audiolist = AlphaWaves;
                                      _subtitlelist = _AlphasubtitleList;
                                    });
                                  },
                                  child: _BottomBox(height, width, 2)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      check1 = true;
                                      mediimg = "medi-poster";
                                      meditext = "Alpha-4";
                                      medisinger = "singer-4";
                                      _index_1 = 3;
                                      suffix = "jpg";
                                      _index_check = false;
                                      _audiolist = AlphaWaves;
                                      _subtitlelist = _AlphasubtitleList;
                                    });
                                  },
                                  child: _BottomBox(height, width, 3)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      check1 = true;
                                      mediimg = "medi-poster";
                                      meditext = "Alpha-5";
                                      medisinger = "singer-5";
                                      _index_1 = 4;
                                      suffix = "jpg";
                                      _index_check = false;
                                      _audiolist = AlphaWaves;
                                      _subtitlelist = _AlphasubtitleList;
                                    });
                                  },
                                  child: _BottomBox(height, width, 4)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      check1 = true;
                                      mediimg = "medi-poster";
                                      meditext = "Alpha-6";
                                      medisinger = "singer-6";
                                      _index_1 = 5;
                                      suffix = "jpg";
                                      _index_check = false;
                                      _audiolist = AlphaWaves;
                                      _subtitlelist = _AlphasubtitleList;
                                    });
                                  },
                                  child: _BottomBox(height, width, 5)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      check1 = true;
                                      mediimg = "medi-poster";
                                      meditext = "Alpha-7";
                                      medisinger = "singer-7";
                                      _index_1 = 6;
                                      suffix = "jpg";
                                      _index_check = false;
                                      _audiolist = AlphaWaves;
                                      _subtitlelist = _AlphasubtitleList;
                                    });
                                  },
                                  child: _BottomBox(height, width, 6)),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 80),
                ],
              ),
              Positioned(
                top: height * 0.99,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Player(
                          img: mediimg,
                          title: meditext,
                          singer: medisinger,
                          suffix: suffix,
                          index: _index_check ? _index : _index_1,
                          Audiolist: _audiolist,
                          Subtitlelist: _subtitlelist),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// the widget for showing all the meditation optins at one place ....

// Widget _BottomUp() {
//   return SingleChildScrollView(
//     child: Container(
//       decoration: MeditationTheme.MedTheme,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [],
//       ),
//     ),
//   );
// }

// the widget to show all the available meditation playlists at one place ...

// ............

//the widget for showing the currently playing song or the audio

// the widget for the bottom showbar of the alpha waves...

Widget _BottomBox(var height, var width, var index) {
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
  return Container(
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
                          fontSize: 16,
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
                          fontSize: 13,
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
  );
}

// the textbar to show the title for the particular section
Widget _TextBar(context, var height, var width, var text, bool check) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 6.0, bottom: 6.0),
    child: Container(
      height: height * 0.1,
      width: check ? (width * 0.73) : width,
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
            
          ]),
    ),
  );
}
