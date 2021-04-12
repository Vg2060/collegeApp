import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:splash1/demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   spot.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.place),
          draggable: false,
          infoWindow:
          InfoWindow(title: element.place),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _collegePlaceList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          spot[index].thumbNail),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 50.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  spot[index].place,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),

                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SKCET_MAP'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(10.9632,76.947), zoom: 14.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: spot.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _collegePlaceList(index);
                  },
                ),
              ),
            )
          ],
        ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: spot[_pageController.page.toInt()].locationCoords,
        zoom: 18.0,
        bearing: 45.0,
        tilt: 60.0)));
  }
}
class College {
  String place;
  String thumbNail;
  LatLng locationCoords;

  College(
      {this.place,
        this.thumbNail,
        this.locationCoords});
}

final List<College> spot = [
  College(
      place: 'ENTRANCE',
      locationCoords: LatLng(10.93907625, 76.95194721),
      thumbNail: 'https://www.google.com/maps/uv?pb=!1s0x3ba85bb22369d571%3A0x72cc0bed93b5b2b6!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPK_YoD8iSJ0IIkUWmBaFBd5IMeSF827N25OH4G%3Dw213-h160-k-no!5sskcet%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipPK_YoD8iSJ0IIkUWmBaFBd5IMeSF827N25OH4G&hl=en&sa=X&ved=2ahUKEwj0r-GhwZDsAhVWeH0KHcbjCwgQoiowDnoECBkQBQ&cshid=1601456238000349'
  ),
  College(
      place: 'KRISHNA TEMPLE',
      locationCoords: LatLng(10.93836696, 76.95268035),
      thumbNail: 'https://srikrishna.ac.in/skt/images/demo/gallery/g3.jpg'
  ),
  College(
      place: 'ADMIN BLOCK',
      locationCoords: LatLng(10.93768226, 76.95639253),
      thumbNail: 'https://www.google.com/maps/uv?pb=!1s0x3ba85bb1b0ab8231:0xc757883437577ff7!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipMvSMrc0vS13rs_f40L4GR5krDmfea0XSf-FWzv%3Dw260-h160-k-no!5sskcet+admin+block+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipMvSMrc0vS13rs_f40L4GR5krDmfea0XSf-FWzv&hl=en&sa=X&ved=2ahUKEwiqhaqf1pDsAhUR63MBHemwAY8QoiowFHoECBUQBg'
  ),
  College(
      place: 'LIBRARY',
      locationCoords: LatLng(10.93855306, 76.95605457),
      thumbNail: 'https://lh3.googleusercontent.com/proxy/UWq_xgeCwgtoVU8lad7F6QBdm-2W4EIKJPHMWFcHRI81_aBXQAP0bHJXreoHoOXEKFQ3UlaA_QzR5CcP2LwbQfjyCphqFECEzAQO8V6gNQWg0A'
  ),

  College(
      place: 'KRISHNA HALL',
      locationCoords: LatLng(10.93929395, 76.95890844),
      thumbNail: 'https://lh3.googleusercontent.com/proxy/iXlstQuKstFy3b7o3HeqGdg0RmxBt5wOJdd941AV53tc-sZ-_BndRX_HcNitOF7JB9DXSKRaaW8iI98Kbveq4ljapxXtksyEUktucP5F5Hn8TDh2Eg'
  ),
  College(
      place: 'JMR-CAFE',
      locationCoords: LatLng(10.93881767, 436.95656848),
      thumbNail: 'https://getmyuni.azureedge.net/college-images-test/sri-krishna-college-of-engineering-and-technology-coimbatore/fabf4ea53980487bb01edf3f4a995ef4.jpeg'
  ),
  College(
      place: 'MEXITOES',
      locationCoords: LatLng(10.93887961, 436.9560259),
      thumbNail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSL4OXfKC2oJk02mjNBHx3haD2P7c699UbmCA&usqp=CAU'
  ),
  College(
      place: 'HOR-MEN',
      locationCoords: LatLng(10.9396521, 76.96112394),
      thumbNail: 'https://www.google.com/maps/uv?pb=!1s0x3ba85bb3bad1a2b1%3A0x423a28dc8d6b5fe5!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipP9AH685bUyNxuzj9vSdCBT44tiwkTSBqBk2CPr%3Dw213-h160-k-no!5sskcet%20hall%20of%20residence%20men%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipP9AH685bUyNxuzj9vSdCBT44tiwkTSBqBk2CPr&hl=en&sa=X&ved=2ahUKEwiU5v72yZDsAhXlxTgGHWyVAXQQoiowC3oECBgQBg'
  ),
  College(
      place: 'HOR-WOMEN',
      locationCoords: LatLng(10.93444832, 76.95329726),
      thumbNail: 'https://lh3.googleusercontent.com/proxy/ffbT05DzKJKY4tYgAzINfRxi_3r5i_sAm3rDsJfvJ5z5VJXN0QGoT2uaZIvpGgr24ahKojhVfM3i2WlLBDrt'
  ),

];


