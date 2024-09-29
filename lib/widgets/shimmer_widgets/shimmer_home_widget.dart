import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../services/screen_size.dart';

class ShimmerHomeWidget extends StatelessWidget {
  const ShimmerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenSize.padding8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenSize.padding10,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenSize.padding10),
            child: Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(height: ScreenSize.padding8),
          Container(
              width: double.infinity,
              height: ScreenSize.screenHeight * 0.53,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              )),
          SizedBox(height: ScreenSize.padding20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: ScreenSize.padding20 * 4,
                  height: ScreenSize.padding10 * 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              SizedBox(width: ScreenSize.padding20),
              Container(
                  width: ScreenSize.padding20 * 5,
                  height: ScreenSize.padding10 * 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              Expanded(child: Container()),
              Container(
                width: 24.0,
                height: 24.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: ScreenSize.padding20),
              Container(
                width: 24.0,
                height: 24.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
