import 'package:findrecycler/add_facility/add_facility.dart';
import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/discard_item/discard_item.dart';
import 'package:findrecycler/facility_information/facility_information.dart';
import 'package:findrecycler/home/home.dart';
import 'package:findrecycler/rewards/rewards.dart';

import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //
    switch (settings.name) {
      //

      case ApplevelRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      case ApplevelRoutes.addFacilityScreen:
        return MaterialPageRoute(
          builder: (_) => AddFacilityScreen(),
          settings: settings,
        );

      case ApplevelRoutes.discardItemScreen:
        return MaterialPageRoute(
          builder: (_) => DiscardItemScreen(data: settings.arguments),
        );

      case ApplevelRoutes.facilityInformationScreen:
        return MaterialPageRoute(
          builder: (_) => FacilityInformationScreen(
            facilityModel: settings.arguments,
          ),
          settings: settings,
        );

      case ApplevelRoutes.rewards:
        return MaterialPageRoute(
          builder: (_) => const Rewards(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => UndefinedView(name: settings.name),
          settings: settings,
        );
    }
  }
}

class UndefinedView extends StatelessWidget {
  const UndefinedView({Key key, this.name}) : super(key: key);

  /// Name of the route....
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong for $name'),
      ),
    );
  }
}
