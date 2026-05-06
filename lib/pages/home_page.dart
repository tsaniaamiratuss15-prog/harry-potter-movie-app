import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isFavorite = false;

  final ScrollController _scrollController =
      ScrollController();

  final GlobalKey sinopsisKey = GlobalKey();
  final GlobalKey genreKey = GlobalKey();
  final GlobalKey reviewKey = GlobalKey();
  final GlobalKey actorKey = GlobalKey();

  void scrollToSection(GlobalKey key) {

    Scrollable.ensureVisible(
      key.currentContext!,

      duration: Duration(milliseconds: 500),

      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 32, 60, 76),

        foregroundColor: Colors.white,

        leading: Icon(Icons.movie),

        title: Text('Harry Potter'),

        actions: [

          // LOVE BUTTON
          IconButton(

            onPressed: () {

              setState(() {
                isFavorite = !isFavorite;
              });
            },

            icon: Icon(

              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,

              color: Colors.white,
            ),
          ),

          // POPUP MENU
          PopupMenuButton<String>(

            onSelected: (value) {

              if (value == 'Sinopsis') {
                scrollToSection(sinopsisKey);
              }

              else if (value == 'Genre') {
                scrollToSection(genreKey);
              }

              else if (value == 'Review') {
                scrollToSection(reviewKey);
              }

              else if (value == 'Actor') {
                scrollToSection(actorKey);
              }
            },

            itemBuilder: (context) => [

              PopupMenuItem(
                value: 'Sinopsis',
                child: Text('Sinopsis'),
              ),

              PopupMenuItem(
                value: 'Genre',
                child: Text('Genre'),
              ),

              PopupMenuItem(
                value: 'Review',
                child: Text('Review'),
              ),

              PopupMenuItem(
                value: 'Actor',
                child: Text('Actor'),
              ),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,

        foregroundColor:
            const Color.fromARGB(255, 32, 60, 76),

        onPressed: () {},

        child: Icon(Icons.play_arrow),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          controller: _scrollController,

          child: Padding(
            padding: EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                // POSTER
                Container(
                  height: 250,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(25),

                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/cover.jpg',
                      ),

                      fit: BoxFit.cover,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                // RICH TEXT
                RichText(
                  text: TextSpan(
                    text: 'Harry ',

                    style: TextStyle(
                      fontSize: 32,
                      color:
                          const Color.fromARGB(
                              255,
                              7,
                              35,
                              77,
                          ),

                      fontWeight: FontWeight.bold,
                    ),

                    children: [

                      TextSpan(
                        text: 'Potter ',

                        style: TextStyle(
                          color:
                              const Color.fromARGB(
                                  255,
                                  170,
                                  160,
                                  25,
                              ),

                          fontStyle:
                              FontStyle.italic,
                        ),
                      ),

                      TextSpan(
                        text: 'Movie',

                        style: TextStyle(
                          color:
                              const Color.fromARGB(
                                  255,
                                  102,
                                  18,
                                  18,
                              ),

                          decoration:
                              TextDecoration
                                  .underline,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // SINOPSIS
                Container(
                  key: sinopsisKey,

                  child: Text(
                    'Sinopsis',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'Harry Potter adalah film fantasi yang menceritakan petualangan Harry Potter sebagai penyihir muda di Hogwarts bersama Ron dan Hermione.',

                  style: TextStyle(fontSize: 16),

                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 25),

                // GENRE
                Container(
                  key: genreKey,

                  child: Text(
                    'Genre',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // ROW 1
                Row(
                  children: [

                    Expanded(
                      child: movieCard(
                        'Fantasy',
                        Icons.auto_awesome,

                        const Color.fromARGB(
                            255,
                            79,
                            114,
                            131,
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: movieCard(
                        'Magic',
                        Icons.star,

                        const Color.fromARGB(
                            255,
                            79,
                            114,
                            131,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                // ROW 2
                Row(
                  children: [

                    Expanded(
                      child: movieCard(
                        'Adventure',
                        Icons.explore,

                        const Color.fromARGB(
                            255,
                            79,
                            114,
                            131,
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: movieCard(
                        'Family',
                        Icons.family_restroom,

                        const Color.fromARGB(
                            255,
                            79,
                            114,
                            131,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // BUTTON REVIEW
                Container(
                  key: reviewKey,

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          Colors.white,

                      backgroundColor:
                          const Color.fromARGB(
                              255,
                              32,
                              60,
                              76,
                          ),

                      minimumSize:
                          Size(double.infinity, 55),
                    ),

                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          '/form',
                      );
                    },

                    child: Text(
                      'Write Review',

                      style:
                          TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // BUTTON ACTOR
                Container(
                  key: actorKey,

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          Colors.white,

                      backgroundColor:
                          const Color.fromARGB(
                              255,
                              32,
                              60,
                              76,
                          ),

                      minimumSize:
                          Size(double.infinity, 55),
                    ),

                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/orientation',
                      );
                    },

                    child: Text(
                      'Actors',

                      style:
                          TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget movieCard(
    String title,
    IconData icon,
    Color color,
  ) {

    return Container(
      height: 130,

      decoration: BoxDecoration(
        color: color,

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

          Icon(
            icon,
            color: Colors.white,
            size: 45,
          ),

          SizedBox(height: 10),

          Text(
            title,

            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}