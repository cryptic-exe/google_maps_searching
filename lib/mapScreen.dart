import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _center = LatLng(20.5937, 78.9629);
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController searchController = new TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
    });

    return position;
  }

  void initState() {
    super.initState();
    getCurrentLocation(); // set false
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // _center == null
          //     ? Container(
          //         child: Center(child: CircularProgressIndicator()),
          //       )
          //     :

          GoogleMap(
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
            ),
            myLocationEnabled: true,
          ),
        ],
      ),
    );
  }
}

// Widget buildBody() {
//   final time = DateTime.now();
//   print('BuildBody at ${time.second}:${time.millisecond}');
//   return ClipRRect(
//     borderRadius: BorderRadius.circular(8),
//     child: Material(
//       child: Column(
//         children: List.generate(100, (index) => index.toString())
//             .map((e) => ListTile(
//                   title: Text(e),
//                 ))
//             .toList(),
//       ),
//     ),
//   );
// }

// Center(
//             child: FloatingSearchBar(
//               builder: (context, _) => buildBody(),
//             ),
//           ),
