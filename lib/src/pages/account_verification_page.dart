import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otobox/src/data/application_message.dart';
import 'package:otobox/src/models/verify_model.dart';
import 'package:otobox/src/pages/forgot_password_page.dart';
import 'package:otobox/src/pages/login_page.dart';
import 'package:otobox/src/screens/main_screen.dart';
import 'package:otobox/src/utils/size_config.dart';

class AccountVerificationPage extends StatefulWidget {
  final SharedPreferences prefs;
  AccountVerificationPage({this.prefs});
  @override
  _AccountVerificationPageState createState() =>
      _AccountVerificationPageState();
}

enum FormMode { CODE }

class _AccountVerificationPageState extends State<AccountVerificationPage> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  String _email;
  String _code;
  String _errorMessage;
  VerifyModel verifyModel;

  // Initial form is login form
  FormMode _formMode = FormMode.CODE;
  bool _isIos;
  bool _isLoading;
  bool _obscurePassword = true;

  Widget _unlock = Icon(
    FontAwesomeIcons.eye,
    color: Color(0xFF18ACA1),
  );

  Widget _lock = Icon(
    FontAwesomeIcons.eyeSlash,
    color: Color(0xFF18ACA1),
  );
  Widget _obscurePass;

  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;

      if (!_obscurePassword) {
        _obscurePass = _unlock;
      } else {
        _obscurePass = _lock;
      }

      if (kDebugMode) print(_obscurePassword);
    });
  }

  // Perform account verification
  Future _validateAndSubmit() async {
    return throw UnimplementedError();
  }

  @override
  void initState() {
    _errorMessage = "Please Check your email address for the verification code";
    _isLoading = false;
    _obscurePass = _lock;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    emailController.text = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFEEF4F3),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: SingleChildScrollView(
            child: _showBody(),
          ),
        ),
      ),
    );
  }

  Widget _showBody() {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'Verify your account',
                  style: TextStyle(
                      color: Color(0xFF18ACA1),
                      fontSize: SizeConfig.safeBlockHorizontal * 6,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _showErrorMessage(),
                  _showEmailInput(),
                  SizedBox(
                    height: 20,
                  ),
                  showCodeInput(),
                  SizedBox(
                    height: 20,
                  ),
                  _isLoading ? _showDisableButton() : _showPrimaryButton(),
                  SizedBox(
                    height: 40,
                  ),
                  showSwitchToLogin(),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
            ),
          ],
        ));
  }

  Widget _showForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => ForgotPasswordPage(),
              ),
            );
          },
          child: Text(
            'Forgot password',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
      ],
    );
  }

  Widget showSwitchToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(
                  prefs: widget.prefs,
                ),
              ),
            );
          },
          child: Text(
            'Do you have an account ? Login',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
      ],
    );
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          _errorMessage,
          style: TextStyle(
              fontSize: 13.0,
              color: Colors.red,
              height: 1.0,
              fontWeight: FontWeight.w300),
        ),
      );
    } else {
      return Container(
        height: 0.0,
      );
    }
  }

  Widget _showEmailInput() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8,
            vertical: SizeConfig.safeBlockVertical * 1.2),
        child: TextFormField(
          maxLines: 1,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Color(0xFF18ACA1),
            ),
            icon: Icon(
              FontAwesomeIcons.envelope,
              color: Color(0xFF18ACA1),
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return EMAIL_CANT_EMPTY;
            }

            if (value.length > 32) {
              return EMAIL_LONG;
            }
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value)) {
              return INVALID_EMAIL;
            }

            return null;
          },
        ),
      ),
    );
  }

  Widget showCodeInput() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8,
            vertical: SizeConfig.safeBlockVertical * 0.8),
        child: TextFormField(
          maxLines: 1,
          obscureText: _obscurePassword,
          autofocus: false,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => {
                _toggleObscurePassword(),
              },
              child: _obscurePass,
            ),
            border: InputBorder.none,
            hintText: 'Code',
            hintStyle: TextStyle(
              color: Color(0xFF18ACA1),
            ),
            icon: Icon(
              FontAwesomeIcons.lock,
              color: Color(0xFF18ACA1),
            ),
          ),
          controller: codeController,
          validator: (value) {
            if (value.isEmpty) {
              return CODE_CANT_EMPTY;
            }

            if (value.length > 10) {
              return CODE_LONG;
            }

            return null;
          },
        ),
      ),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color(0xFF18ACA1),
              child: Text(
                'Verify account',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white),
              ),
              onPressed: _validateAndSubmit,
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
            margin: EdgeInsets.only(right: 30, left: 30),
            child: RaisedButton(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Loading',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: SpinKitThreeBounce(
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
              onPressed: () => {},
            ),
          ),
        ),
      ],
    );
  }

  goToMain() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => MainScreen(),
      ),
    );
  }
}
