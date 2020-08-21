import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {

  String author , title,urlToImage,publishedAt,description ;

  DetailsPage({this.author , this.title , this.description,this.publishedAt,this.urlToImage} );
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            Image.network(
                widget.urlToImage,
                fit:BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0,300.0,0.0,0.0),
              child:Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize:30.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                        Text(widget.publishedAt.substring(0,10),
                            style: TextStyle(
                                fontSize:15.0
                            )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,40.0,0.0,30.0),
                        child: Text(widget.description,
                            style: TextStyle(
                                fontSize:20.0
                            )),
                      ),
                      Text(widget.author.substring(0,10),
                          style: TextStyle(
                              fontSize:15.0
                          )),
                    ],
                  ),
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
