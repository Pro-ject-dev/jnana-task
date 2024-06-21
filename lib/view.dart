import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final String headline;
  final String description;
  final String imageUrl;
  final String createAt;
  final String id;

  DetailsPage({
    Key? key,
    required this.headline,
    required this.description,
    required this.imageUrl,
    required this.createAt,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final GetStorage storage = GetStorage();
  List<Map<String, dynamic>> list = [];
  List id_list = [];

  @override
  void initState() {
    super.initState();
    list = storage.read("datas")?.cast<Map<String, dynamic>>() ?? [];
    id_list = storage.read("id") ?? [];
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 0.9,
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(170, 0, 0, 0).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 60.0, horizontal: 28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.createAt,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.readexPro(
                        color: Color.fromARGB(255, 250, 250, 250),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.headline,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.readexPro(
                        color: Color.fromARGB(255, 250, 250, 250),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 286,
            child: FloatingActionButton(
              heroTag: 'exit',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
              child: Icon(Icons.exit_to_app_rounded),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'save',
              onPressed: () {
                if (id_list.contains(widget.id)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Already Saved !")),
                  );
                } else {
                  final listTemp = {
                    "alt_description": widget.headline,
                    "description": widget.description,
                    "urls": widget.imageUrl,
                    "created_at": widget.createAt,
                  };

                  list.add(listTemp);
                  id_list.add(widget.id);

                  storage.write('datas', list);
                  storage.write('id', id_list);
                  print(storage.read('id'));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Saved Successfully!")),
                  );

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: ((context) => HomePage())));
                }
              },
              child: Icon(Icons.save),
            ),
          ),
        ],
      ),
    );
  }
}
