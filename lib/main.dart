import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superlabs/controller/provider/currentUserProvider.dart';
import 'package:superlabs/controller/provider/index_provider.dart';
import 'package:superlabs/controller/provider/user_provider.dart';
import 'package:superlabs/utils/theme.dart';
import 'package:superlabs/view/home_screens/persistent_bottom_nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
  //     overlays: [SystemUiOverlay.bottom]);
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(const SuperLabs());
}

class SuperLabs extends StatelessWidget {
  const SuperLabs({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<IndexProvider>(
            create: (context) => IndexProvider()),
        ChangeNotifierProvider<CurrentUserProvider>(
            create: (context) => CurrentUserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: PersistentBottomNavBar(),
      ),
    );
  }
}
