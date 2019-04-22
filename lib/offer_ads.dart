// OFERTAS
class OfferAds {
  OfferAds({this.image1, this.refer});
  String image1;
  String refer;
}
List<OfferAds> _offerlist = <OfferAds>[
  OfferAds(image1: 'assets/images/res1.jpg', refer: 'OFFER'),
  OfferAds(image1: 'assets/images/res2.jpg', refer: 'REFER'),
  OfferAds(image1: 'assets/images/res3.jpg', refer: 'OFFER'),
];

class Resname {
  Resname({
    this.image2,
    this.resName,
    this.resPrice,
    this.resTime,
    this.resRating,
    this.resType
  });
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
    resRating: '4.0'
  ),
  Resname(
    image2: 'assets/images/res2.png',
    resName: 'Pollos Copacabana',
    resType: "Comida rapida, Pollo frito",
    resTime: '30',
    resPrice: 'Bs. 40',
    resRating: '4.2'
  ),

];