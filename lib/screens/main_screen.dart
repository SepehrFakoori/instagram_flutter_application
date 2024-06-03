import "package:flutter/material.dart";
import "package:instagram_flutter_application/screens/activity_screen.dart";
import "package:instagram_flutter_application/screens/add_content_screen.dart";
import "package:instagram_flutter_application/screens/home_screen.dart";
import "package:instagram_flutter_application/screens/search_screen.dart";
import "package:instagram_flutter_application/screens/user_profile_screen.dart";

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedBottomNavigationItem,
            onTap: (int index) {
              setState(
                () {
                  _selectedBottomNavigationItem = index;
                },
              );
            },
            // selectedFontSize: 20,
            // selectedIconTheme: IconThemeData(color: Colors.white),
            // selectedItemColor: Colors.red,
            // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            // unselectedFontSize: 12,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            // unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff1C1F2E),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/icon_home.png"),
                activeIcon: Image.asset("assets/images/icon_active_home.png"),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/icon_search_navigation.png"),
                activeIcon: Image.asset(
                    "assets/images/icon_search_navigation_active.png"),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/icon_add_navigation.png"),
                activeIcon:
                    Image.asset("assets/images/icon_add_navigation_active.png"),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/icon_activity_navigation.png"),
                activeIcon: Image.asset(
                    "assets/images/icon_activity_navigation_active.png"),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 2.0,
                      color: Color(0xff1C1F2E),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/profile.png"),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 2.0,
                      color: Color(0xffF35383),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/profile.png"),
                    ),
                  ),
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
        // getLayout().elementAt(_selectedBottomNavigationItem),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
