import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:otobox/src/pages/main_page.dart';
import 'package:otobox/src/widgets/custom_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otobox/src/database/db_helper.dart';
import 'package:otobox/src/models/login_model.dart';
import 'package:otobox/src/pages/register_page.dart';
import 'package:otobox/src/screens/main_screen.dart';
import 'package:otobox/src/utils/size_config.dart';

class LoginPage extends StatefulWidget {
  final SharedPreferences prefs;
  LoginPage({this.prefs});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginModel loginModel;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String _email;
  String _password;

  // Initial form is login form
  bool _isLoading;
  DbHelper dbHelper;

  @override
  void initState() {
    _isLoading = false;
    dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/hexagon.png'),
              Center(
                child: SingleChildScrollView(
                  child: _showBody(),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset('assets/images/hexagon_large.png'),
              )
            ],
          ),
        ));
  }

  Widget _showBody() {
    return new Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              scale: 0.8,
            ),
            SizedBox(height: 10),
            Text(
              'Otobox',
              style: TextStyle(
                fontFamily: 'Calibri',
                color: Color(0xFF103E5F),
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'The modern auto space.',
              style: TextStyle(
                  color: Color(0xFF787B7D), fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 20),
            CustomInput(
              icon: Icon(Icons.person, color: Colors.white),
              input: TextFormField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    hintStyle: TextStyle(
                        color: Color(0xFF787B7D), fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CustomInput(
              icon: Icon(Icons.lock, color: Colors.white),
              input: TextFormField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Color(0xFF787B7D), fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _showPrimaryButton(),
            SizedBox(
              height: 10,
            ),
            _showSwitchToRegister(),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4,
            )
          ],
        ));
  }

  Widget _showSwitchToRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    RegisterPage(prefs: widget.prefs),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Don\'t have an account ? Sign Up',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showPrimaryButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 8),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2.5),
              elevation: 2.0,
              color: Color(0xFF103E5F),
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => MainPage(),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showDisableButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 8),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2.5),
              elevation: 2.0,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Loading',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SpinKitThreeBounce(
                      color: Colors.white,
                      size: 15.0,
                    ),
                  )
                ],
              ),
              onPressed: () => {},
            ),
          ),
        ),
      ],
    );
  }

  void goToMainScreen() {
    MaterialPageRoute(
      builder: (BuildContext context) => MainScreen(),
    );
  }

  void changeButtonState(bool value) {
    setState(() {
      _isLoading = value;
    });
  }
}
