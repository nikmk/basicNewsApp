import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detailsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApi();
  }

  List data;
  Future<String> fetchApi() async {
    var jsonData = await http.get(
        'http://newsapi.org/v2/everything?q=tech&apiKey=df02284a7dd04008a01b8e7c76778271');
    var fetchData = jsonDecode(jsonData.body);
    setState(() {
      data = fetchData["articles"];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "News App",
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
                style: TextStyle(color: Colors.white),
              ),
              leading: MenuB(),
              elevation: 0,
              backgroundColor: Colors.black45,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    author: data[index]["author"],
                                    title: data[index]["title"],
                                    description: data[index]["description"],
                                    urlToImage: data[index]["urlToImage"],
                                    publishedAt: data[index]["publishedAt"],
                                  )));
                    },
                    child: Stack(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35.0),
                                    topRight: Radius.circular(35.0)),
                                child: Image.network(
                                  data[index]["urlToImage"],
                                  fit: BoxFit.cover,
                                  height: 400.0,
                                ))),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                            child: Container(
                              height: 200.0,
                              width: 400.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(35.0),
                                elevation: 10.0,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: Text(data[index]["title"],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  );
                },
                itemCount: data == null ? 0 : data.length,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            )));
  }
}

class MenuB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }
}
