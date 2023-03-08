import 'package:flutter/material.dart';
import 'package:great_places_app/provider/great_places.dart';
import 'package:great_places_app/screens/place_detail_screen.dart';
import 'package:great_places_app/screens/places_form_screen.dart';
import 'package:great_places_app/screens/places_list_screen.dart';
import 'package:great_places_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: const Color(0xFF165FA0),
            fontFamily: 'RobotoFlex',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Color(0xFF201A1B),
                fontFamily: 'RobotoFlex',
                fontSize: 18,
              ),
            ),
          ),
        debugShowCheckedModeBanner: false,
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.placeForm: (ctx) => const PlaceFormScreen(),
          AppRoutes.placeDetail: (ctx) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}