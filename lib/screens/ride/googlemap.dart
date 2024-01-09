import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:larga_davsur/class/variables.dart';
import 'package:larga_davsur/screens/ride/2ndform.dart';

class MyMapScreen extends StatefulWidget {
  @override
  _MyMapScreenState createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  //String googleApikey = "AIzaSyAd4rEAQqf58fCJGABqW99teDP9BcuyN08";

  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(latvalue, longvalue);
  String location = "";
  String CityLocation = "";
  String CountryLocation = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: startLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
        onCameraMove: (CameraPosition cameraPositiona) {
          cameraPosition = cameraPositiona; //when map is dragging
        },
        onCameraIdle: () async {
          //when map drag stops
          List<Placemark> placemarks = await placemarkFromCoordinates(
              cameraPosition!.target.latitude,
              cameraPosition!.target.longitude);
          savelatvalue = cameraPosition!.target.latitude;
          savelongvalue = cameraPosition!.target.longitude;

          setState(() {
            //get place name from lat and lang
            location = "${placemarks.first.street}";
            CityLocation = "${placemarks.first.locality}";
            CountryLocation = "${placemarks.first.country}";
          });
        },
      ),
      Center(
        //picker image on google map
        child: Image.asset(
          "assets/images/iconslocation.png",
          width: 80,
        ),
      ),
      Positioned(
        bottom: 10,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConfirmationScreen()));
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                Size(
                  MediaQuery.of(context).size.width - 25,
                  48,
                ),
              ),
              shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
              elevation: MaterialStateProperty.all(10),
            ),
            child: const Text(
              'Use this address',
              style: TextStyle(
                fontSize: 20, // Set the font size
                fontWeight: FontWeight.bold, // Set the font weight
                color: Colors.white, // Set the text color
                letterSpacing: 1.5, // Set the letter spacing
                // Additional styling options...
              ),
            ),
          ),
        ),
      ),
      Positioned(
        //widget to display location name

        top: 60,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 40,
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/iconslocation.png",
                    width: 25,
                  ),
                  title: Text(
                    location,
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "$CityLocation, $CountryLocation",
                    style: const TextStyle(fontSize: 15),
                  ),
                  dense: true,
                ),
              ),
            )),
      )
    ]));
  }
}
