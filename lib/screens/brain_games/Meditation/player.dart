import 'package:achievex/screens/brain_games/Meditation/meditation_player.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

late IconData _icon = Icons.play_arrow;

class Player extends StatefulWidget {
  final String img;
  final String title;
  final String singer;
  final String suffix;
  final int index;
  final List<dynamic> Audiolist;
  final List<String> Subtitlelist;

  Player(
      {required this.img,
      required this.title,
      required this.singer,
      required this.suffix,
      required this.index,
      required this.Audiolist,
      required this.Subtitlelist});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeditationPlayer(
              MediTitle: widget.title,
              MediImage: "assets/images/${widget.img}.${widget.suffix}",
              suffix: widget.suffix,
              MediList: widget.Audiolist,
              MediSubtitle: widget.Subtitlelist,
              index: widget.index,
            ),
          ),
        );
      },
      child: Container(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/images/${widget.img}.${widget.suffix}",
                    fit: BoxFit.cover,
                  ),
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
                          widget.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Center(
                        child: Text(
                          widget.singer,
                          style: TextStyle(
                            fontSize: 12,
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
            InkWell(
              onTap: () {
                setState(() {
                  _icon == Icons.play_arrow
                      ? _icon = Icons.pause
                      : _icon = Icons.play_arrow;
                });
              },
              child: Icon(
                _icon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
