import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScrollingPart(),
            _getContentNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _getContentNavigationBar() {
    return Container(
      width: double.infinity,
      height: 83,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
        ),
        color: Color(0xff1C1F2E),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Draft",
              style: TextStyle(
                  color: Colors.white, fontFamily: "GB", fontSize: 16),
            ),
            Text(
              "Gallery",
              style: TextStyle(
                  color: Colors.white, fontFamily: "GB", fontSize: 16),
            ),
            Text(
              "Take",
              style: TextStyle(
                  color: Colors.white, fontFamily: "GB", fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWholeScrollingPart() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/item$index.png"),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 83.0),
        ),
      ],
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      height: 394,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FittedBox(
            fit: BoxFit.cover, child: Image.asset("assets/images/item8.png")),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 27.0,
        horizontal: 18.0,
      ),
      child: Row(
        children: [
          Text(
            "Post",
            style:
                TextStyle(color: Colors.white, fontFamily: "GB", fontSize: 24),
          ),
          SizedBox(
            width: 10.0,
          ),
          Image.asset("assets/images/icon_arrow_down.png"),
          Spacer(),
          Text(
            "Next",
            style:
                TextStyle(color: Colors.white, fontFamily: "GB", fontSize: 16),
          ),
          SizedBox(
            width: 5.0,
          ),
          Image.asset("assets/images/icon_arrow_right_box.png"),
        ],
      ),
    );
  }
}
