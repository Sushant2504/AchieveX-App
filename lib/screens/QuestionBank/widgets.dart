import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Widget _Button(String text, IconData? icon) {
    return Container(
      height: 100,
      width: 300,
      color: HexColor("#5C76FF"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon, // Use ! to assert that icon is not null
              size: 18, // Adjust icon size as needed
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }

  Widget _SmallButton(String text, IconData? icon) {
    return Container(
      height: 90,
      width: 100,
      color: HexColor("#5C76FF"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon, // Use ! to assert that icon is not null
              size: 14, // Adjust icon size as needed
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }

  Widget Card(String text, Image image) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                height: 50,
                width: 50,
                color: HexColor("#C8F3FF"),
                child: Image.asset('assets/images/')),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ChapterCard(final int index, String text) {
    return Container(
      height: 100,
      width: 300,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 60,
              width: 60,
              color: const Color.fromARGB(255, 75, 113, 145),
              child: Center(
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    color: Color.fromARGB(255, 26, 52, 72),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Poppins",
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const CircleAvatar(
            radius: 10,
            backgroundColor: Color.fromARGB(255, 14, 62, 101),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _SetCard(Image image, String text, String set) {
    return Container(
      height: 150,
      width: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 70,
            color: Colors.blue,
            child: Center(
              child: Image.asset("assets/images/"),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget TagCard(Color color, String text, Color textcolor) {
    return Container(
      height: 8,
      width: 20,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontFamily: "Poppins",
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
