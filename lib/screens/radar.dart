import 'package:flutter/material.dart';

import '../services/firebase_auth.dart';

class RadarPage extends StatefulWidget {
  const RadarPage({super.key});

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage> {
  Future<void> logout() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: ElevatedButton(
                onPressed: () => logout(), child: const Text("Logout")),
          ),
        ),
      ),
    );
  }
}
