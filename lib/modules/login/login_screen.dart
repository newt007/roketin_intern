import 'package:flutter/material.dart';
import 'package:roketin_intern/config/themes.dart';
import 'package:roketin_intern/modules/register/register_screen.dart';
import 'package:roketin_intern/widgets/components/app_button.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginScreen ({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObsecure = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 128),
          Center(
              child: Image.asset(
            "assets/image/logo-rise.png",
            width: 240,
          )),
          SizedBox(height: 128),
          Text("Email"),
          TextFormField(
            controller: usernameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return "Email must not be empty";
              } else if (!email.isValidEmail()) {
                return "Email is not valid";
              }
            },
            obscureText: false,
            decoration: InputDecoration(
              hintText: "ex: denishdoe",
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text("Password"),
          TextFormField(
            controller: passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (password) {
              if (password == "" || password!.isEmpty) {
                return "Password is required";
              } else if (password.length < 6) {
                return "Password must more than 6 character";
              }
            },
            obscureText: _isObsecure,
            decoration: InputDecoration(
              hintText: "Enter your password",
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(
                    () {
                      _isObsecure = !_isObsecure;
                    },
                  );
                },
                icon:
                    Icon(_isObsecure ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          AppButton(
            text: "Login",
            onPressed: () {},
            options: ButtonOptions(
              width: double.infinity,
              height: 48,
              textStyle: TextStyle(color: Colors.white),
              color: AppTheme.primaryColor,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Want to use Roketin Attendance ?"),
              TextButton(
                  onPressed: () {
                    widget.onClickedSignUp();
                  },
                  child: Text("Get it Now !"))
            ],
          )
        ],
      ),
    );
  }
}
