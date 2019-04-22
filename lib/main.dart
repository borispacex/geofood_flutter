import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'geoFood - project',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Container(
                  height: 10.0,
                  width: 70.0,
                  child: Text('AHORA',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold))),
              SizedBox(
                height: 5.0,
              ),
              Text('................',
                  style: TextStyle(color: Colors.black, fontSize: 15.0)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 12.0,
            ),
          ),
          SizedBox(width: 5.0),
          Column(
            children: <Widget>[
              Container(
                height: 20.0,
                width: 120.0,
                child: TextField(
                    decoration: InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none))),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('.........................',
                  style: TextStyle(color: Colors.black, fontSize: 15.0)),
            ],
          ),
          Container(
            child: Image.asset('assets/images/porcent.png'),
            // descargar una imagen
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 3.0, 0.0),
              child: Text('Ofertas',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                  )
              )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 18.0),
            height: 10.0,
            width: 40.0,
            child: Material(
              color: Colors.orange,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.orange),
                  borderRadius: BorderRadius.circular(1)
              ),
              child: Center(
                child: Text(
                  'NUEVO',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                )
              ),
            ),
          ),
          SizedBox(width: 10.0),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                child: Text(
                  '¿Quedarse hasta tarde? Déjanos servirte.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // crear un data
                    itemCount: _offerlist.length,
                    itemBuilder: (context, index) {
                      final offerlist = _offerlist[index];
                      return Column(
                        children: <Widget>[
                          Container(
                            child: Card(
                              elevation: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    offerlist.image1,
                                    fit: BoxFit.fill,
                                    height: 190.0,
                                    width: 190.0,
                                  ),
                                  Positioned(
                                    left: 15.0,
                                    top: 15.0,
                                    child: Material(
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(
                                          color: Colors.white
                                        )
                                      ),
                                      child: Container(
                                        height: 15.0,
                                        width: 40.0,
                                        child: Center(
                                          child: Text(
                                            offerlist.refer,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// DATA
class OfferAds {
  OfferAds({this.image1, this.refer});
  String image1;
  String refer;
}

List<OfferAds> _offerlist = <OfferAds>[
  OfferAds(image1: 'assets/images/res1.jpg', refer: 'OFERTA'),
  OfferAds(image1: 'assets/images/res2.jpg', refer: 'REFERENCIA'),
  OfferAds(image1: 'assets/images/res3.jpg', refer: 'OFERTA'),
];

class Resname {
  Resname(
      {this.image2,
      this.resName,
      this.resPrice,
      this.resTime,
      this.resRating,
      this.resType});
  String image2;
  String resName;
  String resType;
  String resRating;
  String resTime;
  String resPrice;
}

List<Resname> _resname = <Resname>[
  Resname(
      image2: 'assets/images/res1.png',
      resName: 'Don Pollo',
      resType: "Comida rapida, Pollo a la brasa",
      resTime: '20',
      resPrice: 'Bs. 25',
      resRating: '4.0'),
  Resname(
      image2: 'assets/images/res2.png',
      resName: 'Pollos Copacabana',
      resType: "Comida rapida, Pollo frito",
      resTime: '30',
      resPrice: 'Bs. 40',
      resRating: '4.2'),
];
