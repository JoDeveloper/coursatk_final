import 'package:sailor/sailor.dart';

import '../pages/home.dart';
import '../pages/register.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: "/signup",
      builder: (context, args, params) {
        return Signup();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: "/home",
      builder: (context, args, params) {
        return HomePage();
      },
    ));
  }
}
