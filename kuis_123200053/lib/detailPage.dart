import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kuis_123200053/disease_data.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.diseases,
      required this.isFavorite,
      required this.onToggleFavorite});
  final Diseases diseases;
  final bool isFavorite;
  final void Function() onToggleFavorite;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    void _toogleFavorite() {
      setState(() {
        _isFavorite = !_isFavorite;
      });
      final message =
          _isFavorite ? 'Added to favorites' : 'Remove from favorites';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 1),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Diseases"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _toogleFavorite();
              });
            },
            icon: _isFavorite
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(
                    Icons.favorite_border,
                  ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 2 / 5,
              child: Stack(
                children: [
                  Image.network(
                    widget.diseases.imgUrls,
                    width: double.infinity,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Image.network(widget.diseases.imgUrls)));
                    },
                    child: Icon(Icons.zoom_in),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.diseases.name,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                ListTile(
                  title: Text('Diseases name: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.diseases.name),
                ),
                ListTile(
                  title: Text('Plant name: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.diseases.plantName),
                ),
                ListTile(
                    title: Text('Ciri-Ciri: ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('- ' + widget.diseases.nutshell[0]),
                        Text('- ' + widget.diseases.nutshell[1]),
                        Text('- ' + widget.diseases.nutshell[2]),
                      ],
                    )),
                ListTile(
                  title: Text('Diseases ID: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.diseases.id),
                ),
                ListTile(
                  title: Text('Sympton: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    widget.diseases.symptom,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
