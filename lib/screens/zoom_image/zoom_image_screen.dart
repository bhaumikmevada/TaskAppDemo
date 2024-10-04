import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ZoomImageScreen extends StatefulWidget {
  dynamic params;

   ZoomImageScreen({Key? key,required this.params}) : super(key: key);

  @override
  State<ZoomImageScreen> createState() => _ZoomImageScreenState();
}

class _ZoomImageScreenState extends State<ZoomImageScreen> {

  @override
  void initState() {
    super.initState();

    debugPrint("params image : ${widget.params["url"]}");

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: WidgetZoom(
            heroAnimationTag: "images",
            zoomWidget: Image.network(widget.params["url"])
            ),
      ),
    );
  }
}
