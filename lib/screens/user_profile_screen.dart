import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  // pinned: true,
                  // toolbarHeight: 100,
                  // backgroundColor: Color(0xff1C1F2E),
                  backgroundColor: Colors.transparent,
                  expandedHeight: 170.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/item1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, top: 18.0),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  bottom: PreferredSize(
                    // Size.fromHeight --> it means get all the witdh you can with the height i give to you
                    preferredSize: Size.fromHeight(10.0),
                    child: Container(
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: Color(0xff1C1F2E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getHeaderProfile(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: TabBarViewDelegate(
                    TabBar(
                        dividerColor: Colors.transparent,
                        labelStyle: TextStyle(fontSize: 20, fontFamily: "GB"),
                        unselectedLabelColor: Colors.white54,
                        labelColor: Color(0xffF35383),
                        indicatorWeight: 2.0,
                        indicatorColor: Color(0xffF35383),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.only(bottom: 4),
                        tabs: [
                          Tab(
                            icon:
                                Image.asset("assets/images/icon_tab_posts.png"),
                          ),
                          Tab(
                            icon: Image.asset(
                                "assets/images/icon_tab_bookmark.png"),
                          ),
                        ]),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 18, left: 18),
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
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 20),
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
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getProfileImage(),
          SizedBox(width: 15.0),
          Container(
            height: 70.0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "سپهر فکوری",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SM",
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "sepehrfakoori",
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: "GB",
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset("assets/images/icon_profile_edit.png"),
        ],
      ),
    );
  }

  Widget _getProfileImage() {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 2.0,
            color: Color(0xffF35383),
          )),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11.0),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/images/profile.png"),
          ),
        ),
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  TabBarViewDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Color(0xff1C1F2E), child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
