import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: _getSearchBox(),
          ),
          SliverToBoxAdapter(
            child: _getStoryList(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: FittedBox(
                        child: Image.asset(
                          "assets/images/item$index.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: SliverQuiltedGridDelegate(
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                crossAxisCount: 3,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  // These 5 lines are the Instagram pattern
                  // QuiltedGridTile(1, 1),
                  // QuiltedGridTile(1, 1),
                  // QuiltedGridTile(2, 1),
                  // QuiltedGridTile(1, 1),
                  // QuiltedGridTile(1, 1),

                  // These 5 lines are my patterns
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Container _getSearchBox() {
    return Container(
      height: 46.0,
      margin: EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 0),
      decoration: BoxDecoration(
          color: Color(0xff272B40), borderRadius: BorderRadius.circular(13.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Image.asset("assets/images/icon_search.png"),
            SizedBox(width: 15.0),
            Expanded(
              child: TextField(
                style: TextStyle(fontFamily: "GB", color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search User",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Image.asset("assets/images/icon_scan.png"),
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 23.0,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 8.0, right: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color(0xff272B40),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                child: Text(
                  "Sepehr $index",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "GM",
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//GridView.custom(
//           gridDelegate: SliverQuiltedGridDelegate(
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//             crossAxisCount: 3,
//             repeatPattern: QuiltedGridRepeatPattern.inverted,
//             pattern: [
//               // These 5 lines are the Instagram pattern
//               // QuiltedGridTile(1, 1),
//               // QuiltedGridTile(1, 1),
//               // QuiltedGridTile(2, 1),
//               // QuiltedGridTile(1, 1),
//               // QuiltedGridTile(1, 1),
//
//               // These 5 lines are my patterns
//               QuiltedGridTile(2, 1),
//               QuiltedGridTile(2, 2),
//               QuiltedGridTile(1, 1),
//               QuiltedGridTile(1, 1),
//               QuiltedGridTile(1, 1),
//             ],
//           ),
//           childrenDelegate: SliverChildBuilderDelegate(
//             (context, index) {
//               return Container(
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: FittedBox(
//                     child: Image.asset(
//                       "assets/images/item$index.png",
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             },
//             childCount: 10,
//           ),
//         ),
