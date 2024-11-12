import 'package:anime_world/providers/bests.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/providers/top_rated.dart';
import 'package:anime_world/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RecommendationImg()),
          ChangeNotifierProvider(create: (context) => TopRated()),
          ChangeNotifierProvider(create: (context) => Bests())
        ],
        child: const DetailsScreen(),
      ),
    );
  }
}
