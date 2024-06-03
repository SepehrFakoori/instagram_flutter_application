import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_flutter_application/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        centerTitle: false,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset("assets/images/moodinger_logo.png"),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 18.0),
            child: Image.asset("assets/images/icon_direct.png"),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            // SliverToBoxAdapter(
            //   child: ElevatedButton(
            //     onPressed: () {
            //
            //     },
            //     child: Text("Open BottomSheet"),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 34.0),
                      _getPostHeader(),
                      SizedBox(height: 24.0),
                      _postContent(context),
                    ],
                  );
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 34.0),
              _getPostHeader(),
              SizedBox(height: 24.0),
              _postContent(context),
            ],
          );
        });
  }

  Widget _postContent(context) {
    return Container(
      height: 440,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              child: Image.asset("assets/images/item1.png"),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset("assets/images/icon_video.png"),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 20.0,
                  sigmaX: 20.0,
                ),
                child: Container(
                  height: 46,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15.0),
                      Row(
                        children: [
                          Image.asset("assets/images/icon_hart.png"),
                          SizedBox(width: 6.0),
                          Text(
                            "2.5 k",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42),
                      Row(
                        children: [
                          Image.asset("assets/images/icon_comments.png"),
                          SizedBox(width: 6.0),
                          Text(
                            "1.5 k",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: DraggableScrollableSheet(
                                  initialChildSize: 0.5,
                                  minChildSize: 0.2,
                                  maxChildSize: 0.72,
                                  builder: (context, controller) {
                                    return ShareBottomSheet(
                                      controller: controller,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset("assets/images/icon_share.png"),
                      ),
                      SizedBox(width: 42),
                      Image.asset("assets/images/icon_save.png"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          _getStoryBox(),
          SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sepehrfakoori",
                style: TextStyle(
                    fontFamily: "GB", color: Colors.white, fontSize: 12.0),
              ),
              Text(
                "برنامه نویس موبایل",
                style: TextStyle(
                    fontFamily: "SM", color: Colors.white, fontSize: 12.0),
              ),
            ],
          ),
          Spacer(),
          Image.asset("assets/images/icon_menu.png")
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4.0),
      color: Color(0xffF35383),
      strokeWidth: 2.0,
      // [5 --> Tul khat chin, 2 --> fasele khat chin]
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 38.0,
          width: 38.0,
          child: Image.asset("assets/images/profile.png"),
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryListBox();
        },
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4.0),
            color: Color(0xffF35383),
            strokeWidth: 2.0,
            // [5 --> Tul khat chin, 2 --> fasele khat chin]
            dashPattern: [40, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58.0,
                width: 58.0,
                child: Image.asset("assets/images/profile.png"),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "data",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xff1C1F2E),
                ),
                child: Image.asset("assets/images/icon_plus.png"),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Your Story",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
