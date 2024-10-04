
import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/zoom_image/zoom_image_screen.dart';
import '../utils/AppText.dart';
import '../utils/ColorUtils.dart';


const homeScrenRouteScreen = "/";
const zoomImageRouteScreen = "/zoomImageRouteScreen";

class RouteApp{

  static void navigatedName(BuildContext context,String route,dynamic arguments){
    Navigator.of(context).pushNamed(route,arguments: arguments);
  }

  static Route<dynamic> generatedRoute(RouteSettings settings){

    switch(settings.name){

      case homeScrenRouteScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case zoomImageRouteScreen:
        return MaterialPageRoute(builder: (_) => ZoomImageScreen( params: settings.arguments,));

      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Container(
              child: AppText.TextRegular("No Route Found", 20, ColorUtils.colorBlack),
            ),
          )
        );
    }
  }
}