import 'package:flutter/material.dart';

import '../widgets/shimmer_widgets/shimmer_home_widget.dart';

class RadarPage extends StatefulWidget {
  const RadarPage({super.key});

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: ShimmerHomeWidget()),
    );
  }
}
