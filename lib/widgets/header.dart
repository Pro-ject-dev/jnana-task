import 'package:flutter/material.dart';
import 'package:flutter_task/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                // ignore: sort_child_properties_last
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'Assets/fg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                height: height(context, 0.062),
                width: width(context, 0.13),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning",
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 121, 121, 121),
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ),
                  Text(
                    "Borkat👏",
                    style: GoogleFonts.readexPro(
                        fontSize: 15, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [const Icon(Icons.notifications_none_rounded)],
          )
        ],
      ),
    );
  }
}
