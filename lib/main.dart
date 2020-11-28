import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Home(),
    );
  }
}

class GridView extends StatefulWidget {
  @override
  GridViewState createState() => GridViewState();
}

class GridViewState extends State<GridView> {
  List<String> imageList = [
    'https://pixabay.com/get/55e6d7414f53a514f1dc8460da293276103cdded5b5871_640.jpg',
    'https://pixabay.com/get/54e1d1454b5aad14f1dc8460da293276103cdde25b5871_640.jpg',
    'https://pixabay.com/get/57e8d7414e5aa814f1dc8460da293276103cdded5b5673_640.jpg',
    'https://pixabay.com/get/57e9d0434e52ae14f1dc8460da293276103cdded5b5470_640.jpg',
    'https://pixabay.com/get/54e9d3454f54a514f1dc8460da293276103cdded535678_640.jpg',
    'https://pixabay.com/get/5fe1dd464354b10ff3d89960c62d3f7b163cd6ed5158_640.jpg',
    'https://pixabay.com/get/57e5d3414a50a914f1dc8460da293276103cdded5b5078_640.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(12),
        child: new StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            }),
      ),
    );
  }
}
