import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_places_app/provider/great_places.dart';
import 'package:great_places_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Altera a cor de fundo da statusbar e dos ícones
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),

        title: const Text('Meus Lugares'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
            icon: const Icon(Icons.add_location_alt_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Consumer<GreatPlaces>(
                  child: const Center(
                    child: Text('Nenhum local cadastrado!'),
                  ),
                  builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                      ? ch!
                      : ListView.builder(
                          itemCount: greatPlaces.itemsCount,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(
                                greatPlaces.itemByIndex(i).image,
                              ),
                            ),
                            title: Text(greatPlaces.itemByIndex(i).title),
                            subtitle: Text(
                                greatPlaces.itemByIndex(i).location!.address!),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.placeDetail,
                                arguments: greatPlaces.itemByIndex(i),
                              );
                            },
                          ),
                        ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.placeForm);
        },
        child: const Icon(Icons.add_location_alt_outlined),
      ),
    );
  }
}
