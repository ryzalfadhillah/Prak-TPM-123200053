import 'package:flutter/material.dart';
import 'package:kuis_123200053/detailPage.dart';
import 'package:kuis_123200053/disease_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Plant Diseases')),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Daftar Penyakit Tanaman',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 4),
                itemCount: listDisease.length,
                itemBuilder: (context, index) {
                  final Diseases diseases = listDisease[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    diseases: diseases,
                                    isFavorite: false,
                                    onToggleFavorite: () => {},
                                  )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.network(
                                diseases.imgUrls,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                diseases.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
