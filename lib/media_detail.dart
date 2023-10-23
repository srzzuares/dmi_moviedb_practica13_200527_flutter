import 'package:flutter/material.dart';
import 'package:movieapp_20091/model/Media.dart'; //
import 'dart:ui' as ui;

class MediaDetail extends StatelessWidget {
  final Media media;
  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: new Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          new SingleChildScrollView(
            child: new Container(
              margin: const EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    child: new Container(
                      width: 390.0,
                      height: 390.0,
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: new DecorationImage(
                            image: new NetworkImage(media.getPosterUrl())),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: new Offset(0.0, 10.0))
                        ]),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  new Container(
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    child: new Row(children: <Widget>[
                      new Expanded(
                          child: new Text(
                        media.title,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontFamily: 'MiFuente'),
                      )),
                      new Text(
                        '${media.voteAverage.toString()}/10',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontFamily: 'MiFuente'),
                      )
                    ]),
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        media.overview,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'MiFuente'),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
