import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:larga_davsur/class/variables.dart';
import 'package:larga_davsur/class/widgets.dart';
import 'package:larga_davsur/screens/ride/googlemap.dart';

class ride_firstform extends StatefulWidget {
  const ride_firstform({super.key});

  @override
  State<ride_firstform> createState() => _ride_firstformState();
}

class _ride_firstformState extends State<ride_firstform> {
  void initState() {
    super.initState();

    // Call your function here
    getCurrentLocation();
  }

  TextEditingController _addressController = TextEditingController();
  //TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressDestination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orange.shade200,
          Colors.orange.shade300,
          Colors.orange.shade500 //hexStringToColor("CB2B93"),
          //hexStringToColor("9546C4"),
          //hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            reusableTextField("", Icons.location_on, false, _addressController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Destination", Icons.location_on, false, _addressDestination),
            const SizedBox(
              height: 20,
            ),
            generalButton(context, "Next", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyMapScreen()));
            }),
            //  SignUpOption(),
          ]),
        )),
      ),
    );
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, handle it accordingly
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission still denied, handle it accordingly
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied, handle it accordingly
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Get the address from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    latvalue = position.latitude;
    longvalue = position.longitude;

    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String address =
          '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';

      setState(() {
        _addressController.text = address;
      });
    }
  }
}
