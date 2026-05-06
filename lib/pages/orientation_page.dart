import 'package:flutter/material.dart';

class OrientationPage extends StatelessWidget {

  OrientationPage({super.key});

  final List<Map<String, String>> actors = [

    {
      'name': 'Daniel Radcliffe',
      'image': 'assets/images/daniel.jpg',
    },

    {
      'name': 'Emma Watson',
      'image': 'assets/images/emma.jpg',
    },

    {
      'name': 'Rupert Grint',
      'image': 'assets/images/rupert.jpg',
    },

    {
      'name': 'Lox Pratt',
      'image': 'assets/images/lox.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {

    Orientation orientation =
        MediaQuery.of(context).orientation;

    return Scaffold(

      backgroundColor:
          Colors.white,

      appBar: AppBar(

        backgroundColor:
            const Color.fromARGB(255, 32, 60, 76),

        foregroundColor: Colors.white,

        title: Text('Harry Potter Actors'),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: GridView.count(

          crossAxisCount:
              orientation == Orientation.portrait
                  ? 2
                  : 4,

          crossAxisSpacing: 15,
          mainAxisSpacing: 15,

          children: actors.map((actor) {

            return Container(

              decoration: BoxDecoration(

                color:
                    const Color.fromARGB(
                        255, 79, 114, 131
                    ),

                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  ),
                ],
              ),

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  CircleAvatar(
                    radius: 60,

                    backgroundImage: AssetImage(
                      actor['image']!,
                    ),
                  ),

                  SizedBox(height: 15),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(
                            horizontal: 8),

                    child: Text(
                      actor['name']!,

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}