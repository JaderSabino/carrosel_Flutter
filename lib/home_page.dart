import 'package:carrosel_flutter/slide_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  var _listSlide = [
    {'id': 0, 'image': 'assets/images/img1.jpg'},
    {'id': 1, 'image': 'assets/images/img2.jpg'},
    {'id': 2, 'image': 'assets/images/img3.jpg'},
    {'id': 3, 'image': 'assets/images/img4.jpg'},
    {'id': 4, 'image': 'assets/images/img5.jpg'},
    {'id': 5, 'image': 'assets/images/img6.jpg'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: _listSlide.length,
                  itemBuilder: (_, currentIndex) {
                    bool activePage = currentIndex == _currentPage;
                    return SlideTile(
                        activePage: activePage,
                        image: _listSlide[currentIndex]['image']);
                  })),
          buildBullets()
        ],
      )),
    );
  }

  Widget buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _listSlide.map((image) {
            return InkWell(
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(image['id']);
                  _currentPage = image['id'];
                });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:
                        _currentPage == image['id'] ? Colors.red : Colors.grey),
              ),
            );
          }).toList()),
    );
  }
}
