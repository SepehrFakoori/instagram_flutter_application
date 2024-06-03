import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  final ScrollController? controller;

  const ShareBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 40.0,
          sigmaX: 40.0,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          color: Color.fromRGBO(255, 255, 255, 0.09),
          child: _getContent(context, controller),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context, controller) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5.0,
                    width: 67.0,
                    margin: EdgeInsets.only(top: 10.0, bottom: 22.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Share",
                        style: TextStyle(
                          fontFamily: "GB",
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset("assets/images/icon_share_bottomsheet.png"),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    height: 46.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        borderRadius: BorderRadius.circular(13.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Image.asset("assets/images/icon_search.png"),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search User",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getItemGrid();
                },
                childCount: 100,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 10.0,
                  crossAxisCount: 4,
                  mainAxisExtent: 110),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 120.0)),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 45.0, vertical: 13.0),
              child: Text(
                "Share",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset("assets/images/profile.png"),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          "Amirahmad Adibi",
          textAlign: TextAlign.center,
          style:
              TextStyle(fontFamily: "GB", fontSize: 12.0, color: Colors.white),
        )
      ],
    );
  }
}
