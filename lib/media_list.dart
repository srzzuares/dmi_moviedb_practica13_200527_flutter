// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir interfaces de usuario.
import 'package:movieapp_20091/common/HttpHandler.dart'; // Importa la clase HttpHandler desde un archivo llamado HttpHandler.dart.
import 'package:movieapp_20091/media_detail.dart';
import 'package:movieapp_20091/model/Media.dart'; // Importa la clase Media desde un archivo llamado Media.dart.
import 'package:movieapp_20091/media_list_item.dart';
import 'package:movieapp_20091/media_detail.dart';
import 'package:movieapp_20091/common/MediaProvider.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String category;
  MediaList(this.provider, this.category);
  @override
  _MediaListState createState() =>
      new _MediaListState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = [];
      loadMedia();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var media = await widget.provider.fetchMedia(widget.category);
    setState(() {
      _media.addAll(media);
    });
  }

  // Define una clase que extiende State y representa el estado interno de MediaList.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8), // Establece el margen aquí
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MediaDetail(_media[index]);
                }));
              },
              child: MediaListItem(_media[index]),
            ),
          );
        },
      ),
    );
  }
}
