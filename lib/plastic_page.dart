import 'package:flutter/material.dart';
import 'package:recycle_hub_bd/pickup_details.dart';
// import 'package:recycle_hub_bd/pickup_details.dart';

class PlasticPage extends StatelessWidget {
  const PlasticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Plastic', 'BDT 20/KG',
                      'assets/images/plastic.jpeg', false, false, context),
                  _buildCard('Mix Plastic', 'BDT 15/kg',
                      'assets/images/mixplastic.jpeg', false, false, context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}

Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PickupRequestForm()));

            // _scaleController.forward();
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [isFavorite ? Icon(null) : Icon(null)]),
                ),
                Hero(
                    tag: imgPath,
                    child: Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)))),
                SizedBox(height: 7.0),
                Text(price,
                    style: TextStyle(
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!added) ...[
                            Icon(Icons.arrow_right,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('PICKUP REQUEST',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontSize: 12.0))
                          ],
                          if (added) ...[
                            Icon(Icons.remove_circle_outline,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('3',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0)),
                            Icon(Icons.add_circle_outline,
                                color: Color(0xFFD17E50), size: 12.0),
                          ]
                        ]))
              ]))));
}
