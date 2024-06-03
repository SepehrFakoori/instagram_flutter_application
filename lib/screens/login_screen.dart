import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff323A99), Color(0xffF98BFC)],
        ),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false --> handle error of overflow because of "Sign in" buttun when focus on textFields
        resizeToAvoidBottomInset: false,
        // Scaffold in default has a white background so we transparent the Scaffold background color to see the gradient.
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getContainerBox(),
          ],
        ),
      ),
    );
  }

  Column _getContainerBox() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Color(0xff1C1F2E),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Sign in ",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Image(
                      image: AssetImage("assets/images/mood.png"),
                    ),
                  ],
                ),
                SizedBox(height: 34.0),
                _textField("Email", emailFocusNode),
                SizedBox(height: 32.0),
                _textField("Password", passwordFocusNode),
                SizedBox(height: 32.0),
                SizedBox(
                  height: 46,
                  width: 129,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text("Sign In"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding _textField(String labelText, FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0),
      child: TextField(
        focusNode: focusNode,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          label: Text(
            labelText,
            style: TextStyle(
              color: focusNode.hasFocus ? Color(0xffF35383) : Color(0xffC5C5C5),
              fontFamily: "GM",
              fontSize: 20,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xffF35383),
              width: 3.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xffC5C5C5),
              width: 3.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 80.0,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage("assets/images/rocket.png"),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
