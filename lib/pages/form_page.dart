import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();

  String nama = '';
  String review = '';
  String rating = '';

  // LIST DATA REVIEW
  List<Map<String, String>> reviewList = [];

  void submitData() {

    if (_formKey.currentState!.validate()) {

      _formKey.currentState!.save();

      // MASUKKAN DATA KE LIST
      setState(() {

        reviewList.add({
          'nama': nama,
          'review': review,
          'rating': rating,
        });
      });

      // POPUP
      showDialog(
        context: context,

        builder: (context) {
          return AlertDialog(
            title: Text('Review Saved'),

            content: Text(
              'Nama: $nama\n'
              'Rating: $rating',
            ),

            actions: [

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: Text('OK'),
              ),
            ],
          );
        },
      );

      // RESET FORM
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 60, 76),
        foregroundColor: Colors.white,
        title: Text('Movie Review'),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.all(16),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // NAMA
                  TextFormField(

                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {

                      if (value == null ||
                          value.isEmpty) {

                        return 'Nama wajib diisi';
                      }

                      return null;
                    },

                    onSaved: (value) {
                      nama = value!;
                    },
                  ),

                  SizedBox(height: 20),

                  // REVIEW
                  TextFormField(

                    maxLines: 4,

                    decoration: InputDecoration(
                      labelText: 'Review',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {

                      if (value == null ||
                          value.isEmpty) {

                        return 'Review wajib diisi';
                      }

                      return null;
                    },

                    onSaved: (value) {
                      review = value!;
                    },
                  ),

                  SizedBox(height: 20),

                  // RATING
                  TextFormField(

                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: 'Rating 1-10',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {

                      if (value == null ||
                          value.isEmpty) {

                        return 'Rating wajib diisi';
                      }

                      return null;
                    },

                    onSaved: (value) {
                      rating = value!;
                    },
                  ),

                  SizedBox(height: 30),

                  // BUTTON
                  ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 32, 60, 76),

                      foregroundColor: Colors.white,

                      minimumSize:
                          Size(double.infinity, 55),
                    ),

                    onPressed: submitData,

                    child: Text(
                      'Save Review',

                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // JUDUL TABEL
                  Text(
                    'Review List',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  // TABEL
                  SingleChildScrollView(

                    scrollDirection: Axis.horizontal,

                    child: DataTable(

                      headingRowColor:
                          MaterialStateProperty.all(
                        const Color.fromARGB(
                            255,
                            79,
                            114,
                            131,
                        ),
                      ),

                      columns: [

                        DataColumn(
                          label: Text(
                            'Nama',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                        DataColumn(
                          label: Text(
                            'Review',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                        DataColumn(
                          label: Text(
                            'Rating',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],

                      rows: reviewList.map((item) {

                        return DataRow(
                          cells: [

                            DataCell(
                              Text(item['nama']!),
                            ),

                            DataCell(
                              Text(item['review']!),
                            ),

                            DataCell(
                              Text(item['rating']!),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}