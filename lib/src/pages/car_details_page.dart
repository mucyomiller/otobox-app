import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otobox'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 250.0,
                child: Carousel(
                  images: [
                    NetworkImage('https://i.imgur.com/qhziBF2.jpg'),
                    NetworkImage('https://i.imgur.com/gDuUt8V.jpg'),
                  ],
                  dotSize: 5.0,
                  dotSpacing: 20.0,
                  dotColor: Colors.white,
                  indicatorBgPadding: 8.0,
                  dotBgColor: Colors.transparent,
                  borderRadius: false,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Add more pictures',
                          style: TextStyle(fontSize: 21, color: Colors.grey),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Icon(Icons.linked_camera, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Make*'),
                        Text('choose Make'),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Model*'),
                        Text('choose Model'),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Year*'),
                        Text('choose year'),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Make*'),
                        Text('choose Make'),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Post your car',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
