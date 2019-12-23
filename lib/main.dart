import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'notifirers/user_notifier.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'repository/user_repository.dart';
import 'utils/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init Hive
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // insure that app works only on portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // generat navigation routes
  Routes.createRoutes();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserNotifier>(
        create: (context) => new UserNotifier(),
      ),
      ChangeNotifierProvider<UserRepository>(
        create: (context) => new UserRepository(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = UserRepository.hasToken();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? LoginPage() : HomePage(),
    );
  }
}
