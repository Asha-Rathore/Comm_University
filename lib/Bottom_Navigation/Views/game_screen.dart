import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // List<Marker> _markers = [];
  // late CameraPosition map;

  // @override
  // void initState() {
  //   map = CameraPosition(
  //     target: LatLng(
  //       25.013176,67.314583
  //       // widget.latitude!, widget.longitutde!
  //     ),
  //     //double.parse()
  //     zoom: 14,
  //   );

  //   _markers.add(
  //     Marker(
  //       markerId: MarkerId("SomeId"),
  //       position: LatLng(
  //         25.013176,67.314583
  //         // widget.latitude!, widget.longitutde!
  //       ),
  //     )
  //   );
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[]
    );
    // return GoogleMap(
    //   initialCameraPosition: map,
    //   markers: Set<Marker>.of(_markers),
    // );
  }
}
