import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'add_picture.dart';

class ViewTravel extends StatelessWidget {
  const ViewTravel({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TravelView(),
    );
  }
}

class TravelView extends StatefulWidget {
  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> with TickerProviderStateMixin {
  @override
  void initState() {
    initMarkers();
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  void initMarkers() {
    List<LatLng> longs = [
      const LatLng(-16.399149323637882, -71.53755335654093),
      const LatLng(-16.399231662557565, -71.5371402963719),
      const LatLng(-16.39940148646941, -71.53667895644287),
      const LatLng(-16.399602187265145, -71.53635709137609),
      const LatLng(-16.399075990508305, -71.53516753173349)
    ];
    for (var i = 0; i < longs.length; i++) {
      String istring = i.toString();
      markers.add(Marker(
        markerId: MarkerId(istring),
        position: longs[i],
        infoWindow: const InfoWindow(title: 'probando'),
        onTap: () {
          showModalBottom("modal " + istring);
        },
      ));
    }
  }

  late final TabController _tabController;
  Set<Marker> markers = {};
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-16.399149323637882, -71.53755335654093),
    zoom: 14.4746,
  );

  Marker m1 = Marker(
    markerId: const MarkerId('m1'),
    position: const LatLng(37.43296265331129, -122.08832357078792),
    infoWindow: const InfoWindow(title: 'probando'),
    onTap: () {},
  );

  final items = List<ListItem>.generate(
    15,
    (i) => MessageItem("Sender $i", "Message body $i"),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viaje a caracas'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.map_rounded),
            ),
            Tab(
              icon: Icon(Icons.image),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            markers: markers,
            polylines: {
              Polyline(
                polylineId: const PolylineId("ruta"),
                color: Colors.red,
                width: 5,
                points: markers.map((e) => e.position).toList(),
              )
            },
          ),
          ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: items.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = items[index];

              return ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubtitle(context),
              );
            },
          ),
        ],
        physics: const NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyAppMyCustomForm()),
          );
        },
        label: const Text('Add Photo'),
        icon: const Icon(Icons.photo_camera),
      ),
    );
  }

  void showModalBottom(String name) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 200,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  height: 220,
                  child: ClipRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                        height: 220,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("img/Dashboard-Travel-Google.jpg"),
                        ))),
                  )),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("img/Dashboard-Travel-Google.jpg"),
                          fit: BoxFit.cover))),
              const SizedBox(
                height: 16,
              ),
              Column(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
