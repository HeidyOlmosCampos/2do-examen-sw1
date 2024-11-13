import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class EmergencyMapScreen extends StatefulWidget {
  final Emergency emergency;

  EmergencyMapScreen({required this.emergency});

  @override
  _EmergencyMapScreenState createState() => _EmergencyMapScreenState();
}

class _EmergencyMapScreenState extends State<EmergencyMapScreen> {
  late GoogleMapController mapController;

  final Set<Marker> _markers = {};
  bool addCoordinateE =
      false; // Bandera para controlar coordinatesE o coordinatesPC

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    // Marcador para la coordenada principal
    _markers.add(
      Marker(
        markerId: const MarkerId('coordinate'),
        position: LatLng(
          double.parse(widget.emergency.coordinates[1]),
          double.parse(widget.emergency.coordinates[0]),
        ),
        infoWindow: InfoWindow(
          title: 'Coordenadas',
          snippet: widget.emergency.locationDescription,
        ),
      ),
    );

    // Marcador para la coordenada E (coordinateE)
    if (widget.emergency.coordinatesE != null) {
      _markers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          markerId: const MarkerId('coordinateE'),
          position: LatLng(
            double.parse(widget.emergency.coordinatesE![1]),
            double.parse(widget.emergency.coordinatesE![0]),
          ),
          infoWindow: const InfoWindow(
            title: 'Coordenadas E',
            snippet: 'Some description here',
          ),
        ),
      );
    }

    // Marcador para la coordenada PC (coordinatePC)
    if (widget.emergency.coordinatesPC != null) {
      _markers.add(
        Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          markerId: const MarkerId('coordinatePc'),
          position: LatLng(
            double.parse(widget.emergency.coordinatesPC![1]),
            double.parse(widget.emergency.coordinatesPC![0]),
          ),
          infoWindow: const InfoWindow(
            title: 'Coordenadas PC',
            snippet: 'Some description here',
          ),
        ),
      );
    }
  }

  void _addCoordinatePcMarker(LatLng latLng) {
    final emergencyImageProvider = context.read<EmergencyImageProvider>();
    emergencyImageProvider.uploadCoordinatesPC(
        widget.emergency.id, [latLng.longitude, latLng.latitude]);
    setState(() {
      _markers
          .removeWhere((marker) => marker.markerId.value == 'newCoordinatePc');
      _markers.add(
        Marker(
          markerId: MarkerId('newCoordinatePc'),
          position: latLng,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: const InfoWindow(
            title: 'Nueva Coordenada PC',
            snippet: 'Ubicación seleccionada por el usuario',
          ),
        ),
      );
    });

    print('Nueva coordenada PC: ${latLng.latitude}, ${latLng.longitude}');
  }

  void _addCoordinateEMarker(LatLng latLng) {
    final emergencyImageProvider = context.read<EmergencyImageProvider>();
    emergencyImageProvider.uploadCoordinatesE(
        widget.emergency.id, [latLng.longitude, latLng.latitude]);
    setState(() {
      _markers
          .removeWhere((marker) => marker.markerId.value == 'newCoordinateE');
      _markers.add(
        Marker(
          markerId: MarkerId('newCoordinateE'),
          position: latLng,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: const InfoWindow(
            title: 'Nueva Coordenada E',
            snippet: 'Ubicación seleccionada por el usuario',
          ),
        ),
      );
    });

    print('Nueva coordenada E: ${latLng.latitude}, ${latLng.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Mapa Situacional'),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap: (latLng) {
              if (addCoordinateE) {
                _addCoordinateEMarker(latLng);
              } else {
                _addCoordinatePcMarker(latLng);
              }
            },
            onMapCreated: (controller) {
              mapController = controller;
              mapController.setMapStyle('''
               [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8ec3b9"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1a3646"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#4b6878"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#64779e"
      }
    ]
  },
  {
    "featureType": "administrative.province",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#4b6878"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#334e87"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#283d6a"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6f9ba5"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3C7680"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#304a7d"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#98a5be"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2c6675"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#255763"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#b0d5ce"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#98a5be"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#283d6a"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3a4762"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0e1626"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#4e6d70"
      }
    ]
  }
]
              ''');
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse(widget.emergency.coordinates[1]),
                double.parse(widget.emergency.coordinates[0]),
              ),
              zoom: 15,
            ),
            markers: _markers,
          ),
          Positioned(
            bottom: 30,
            left: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      addCoordinateE = true;
                    });
                  },
                  backgroundColor: Colors.blue,
                  tooltip: 'Añadir Coordenada E',
                  child: const Icon(Icons.location_on),
                ),
                SizedBox(height: 16), // Espacio entre los botones
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      addCoordinateE =
                          false; // Establecer bandera para coordinatesPC
                    });
                  },
                  backgroundColor: Colors.green,
                  tooltip: 'Añadir Coordenada PC',
                  child: const Icon(Icons.location_on),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
