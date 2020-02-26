import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {

  final bool activePage;
  final String image;

  SlideTile({Key key, this.image, this.activePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double top = this.activePage ? 50 : 100;
    final double blur = this.activePage ? 30 : 0;
    final double offset = this.activePage ? 20 : 0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInQuad,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(this.image),
          fit: BoxFit.cover
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: blur,
            offset: Offset(offset, offset)
          )
        ]
      ),
    );
  }
}