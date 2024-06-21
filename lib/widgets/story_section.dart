import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class Story extends StatelessWidget {
  final bgimg, fgimg, iconstatus, text, lp;

  const Story(
      {super.key,
      required this.bgimg,
      required this.fgimg,
      required this.iconstatus,
      required this.text,
      this.lp = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: lp),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: height(context, 0.17),
              width: width(context, 0.26),
              color: Colors.red,
              child: Image.asset(
                bgimg,
                fit: BoxFit.fill,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              fgimg,
              fit: BoxFit.cover,
              height: height(context, 0.05),
              width: width(context, 0.095),
            ),
          ),
          iconstatus
              ? const Positioned(
                  bottom: 42,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 10,
                      color: Colors.red,
                    ),
                  ),
                )
              : Container(),
          Positioned(
            bottom: 10,
            child: Text(
              text,
              style: GoogleFonts.lato(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> story_list = [
  {"bg-img": "Assets/vijay.jpg", "fg-img": "Assets/fg.jpg", "text": "Person 1"},
  {"bg-img": "Assets/vijay.jpg", "fg-img": "Assets/fg.jpg", "text": "Person 2"},
  {"bg-img": "Assets/vijay.jpg", "fg-img": "Assets/fg.jpg", "text": "Person 3"},
  {"bg-img": "Assets/vijay.jpg", "fg-img": "Assets/fg.jpg", "text": "Person 4"}
];
