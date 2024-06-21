import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class imgsection extends StatelessWidget {
  final title, img, date, issaved, person;
  imgsection(
      {super.key,
      required this.title,
      required this.img,
      this.date,
      this.issaved,
      required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Stack(
        children: [
          Container(
            height: height(context, 0.22),
            width: width(context, 0.9),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(img, fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: height(context, 0.27),
            width: width(context, 0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 25,
                            width: 25,
                            child:
                                Image.asset('Assets/fg.jpg', fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          person.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(issaved ? Icons.bookmark : Icons.bookmark_border_sharp,
                        color: Colors.blue),
                  ],
                ),
                SizedBox(height: 37),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -2,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(Icons.favorite_border, color: Colors.blue),
                          SizedBox(width: 5),
                          Text("2,345"),
                          SizedBox(width: 12),
                          Icon(Icons.comment_bank_outlined, color: Colors.blue),
                          SizedBox(width: 5),
                          Text("543"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.subdirectory_arrow_right_rounded,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
