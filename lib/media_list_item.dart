import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_20091/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
              child: new Stack(
            children: <Widget>[
              new FadeInImage.assetNetwork(
                placeholder: "assets/placeholder.gif",
                image: media.getBackDropUrl(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
                fadeInDuration: new Duration(milliseconds: 500),
              ),
              new Positioned(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 31, 32, 31).withOpacity(0.8),
                  ),
                  constraints: new BoxConstraints.expand(
                    height: 85.0,
                  ),
                ),
              ),
              new Positioned(
                left: 10.0,
                bottom: 30.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        media.title,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    new Container(
                      width: 250.0,
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        media.getGenres(),
                        style: new TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              new Positioned(
                  right: 5.0,
                  bottom: 10.0,
                  child: new Column(children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(media.voteAverage.toString()),
                        new Container(
                          width: 4.0,
                        ),
                        new Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 16,
                        )
                      ],
                    ),
                    new Container(
                      height: 4.0,
                    ),
                    new Row(children: <Widget>[
                      new Text(media.releaseDate.toString()),
                      new Container(
                        width: 4.0,
                      ),
                      new Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 16,
                      )
                    ])
                  ]))
            ],
          ))
        ],
      ),
    );
  }
}
