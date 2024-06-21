import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/variables.dart';
import 'package:flutter_task/view.dart';
import 'package:flutter_task/widgets/header.dart';
import 'package:flutter_task/widgets/image_card.dart';
import 'package:flutter_task/widgets/story_section.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

const String unsplashAccessKey = 'e8nyJmvj-La0klaIoJh6VwGPmgnNXbdJPFrx7p6R4XY';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List photos = [];
  List idlist = [];

  void fetchPhotos() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.unsplash.com/photos/?client_id=$unsplashAccessKey'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          photos = jsonData;
          print(photos);
        });
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPhotos();
    setState(() {
      idlist = (GetStorage().read("id")) ?? [];
    });

    print(idlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const header(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
            child: Row(
              children: [
                const Story(
                    bgimg: 'Assets/vijay.jpg',
                    fgimg: 'Assets/fg.jpg',
                    iconstatus: true,
                    text: "Add Story"),
                Expanded(
                  child: SizedBox(
                    height: height(context, 0.18),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: story_list.length,
                        itemBuilder: ((context, index) {
                          final story = story_list[index];
                          return Story(
                              bgimg: story['bg-img'],
                              fgimg: story['fg-img'],
                              iconstatus: false,
                              text: story['text'],
                              lp: 10.0);
                        })),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Popular",
                    style: GoogleFonts.readexPro(
                        fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: height(context, 0.05),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: content.length,
                        itemBuilder: ((context, index) {
                          final story = content[index];
                          return Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              story,
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 116, 116, 116),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        })),
                  ),
                )
              ],
            ),
          ),
          photos.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      final id = photo['id'];
                      final headline =
                          photo['alt_description'] ?? 'No headline available';
                      final description =
                          photo['description'] ?? 'No description available';
                      final imageUrl = photo['urls']['regular'];
                      final createdAt =
                          photo['updated_at'].toString().split("T")[0];

                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  headline: headline,
                                  description: description,
                                  imageUrl: imageUrl,
                                  createAt: createdAt,
                                  id: id,
                                ),
                              ),
                            );
                          },
                          child: imgsection(
                            title: headline,
                            img: imageUrl,
                            person: "Person ${(index + 1).toString()}",
                            date: createdAt,
                            issaved:
                                idlist != null ? idlist.contains(id) : false,
                          ));
                    },
                  ),
                ),
        ],
      ),
    ));
  }
}
