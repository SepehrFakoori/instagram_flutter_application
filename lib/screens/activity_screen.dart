import 'package:flutter/material.dart';
import 'package:instagram_flutter_application/models/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  // SingleTickerProviderStateMixin and Ticker Provider is for animation handling

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70.0,
              color: Color(0xff1C1F2E),
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 20, fontFamily: "GB"),
                unselectedLabelColor: Colors.white54,
                labelColor: Color(0xffF35383),
                indicatorWeight: 4.0,
                indicatorColor: Color(0xffF35383),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    text: "Following",
                  ),
                  Tab(
                    text: "You",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  // for the 1st Tab
                  _getSampleList(),
                  // for the 2nd Tab
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView _getSampleList() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Text(
              "New",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "GB",
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Text(
              "Today",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "GB",
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 4,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Text(
              "This Week",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "GB",
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.followBack);
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }

  Widget _getRow(status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
      child: Row(
        children: [
          Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 7.0,
          ),
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("assets/images/item8.png")),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Sepehrfakoori",
                    style: TextStyle(
                      fontFamily: "GB",
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "Started following",
                    style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12.0,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "you",
                    style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12.0,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "3 min",
                    style: TextStyle(
                      fontFamily: "GB",
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return _getElevatedButton();
      case ActivityStatus.following:
        return _getOutlinedButton();
      case ActivityStatus.likes:
        return _getImage();
      default:
        return _getOutlinedButton();
    }
  }

  SizedBox _getElevatedButton() {
    return SizedBox(
      width: 70,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffF35383),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(0),
        ),
        onPressed: () {},
        child: Text(
          "Follow",
          style: TextStyle(
            fontFamily: "GB",
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _getOutlinedButton() {
    return SizedBox(
      width: 70,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          side: BorderSide(color: Color(0xffC5C5C5), width: 2.0),
          padding: EdgeInsets.all(0),
        ),
        onPressed: () {},
        child: Text(
          "Message",
          style: TextStyle(
            fontFamily: "GB",
            fontSize: 10,
            color: Color(0xffC5C5C5),
          ),
        ),
      ),
    );
  }

  Widget _getImage() {
    return SizedBox(
      height: 40.0,
      width: 40.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FittedBox(
            fit: BoxFit.cover, child: Image.asset("assets/images/item1.png")),
      ),
    );
  }
}
