import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_places_app/models/place.dart';
import 'package:great_places_app/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        // Altera a cor de fundo da statusbar e dos ícones
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),

        title: Text(place.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.file(
                place.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                place.location!.address!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: TextButton.icon(
                icon: const Icon(Icons.map_rounded),
                label: const Text('Ver no Mapa'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: ((context) => MapScreen(
                          isReadOnly: true,
                          initialLocation: place.location as PlaceLocation,
                        )),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
