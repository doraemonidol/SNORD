import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/authentication/widgets/config.dart';
import 'package:rehabox/src/service/firebase_auth_methods.dart';
import 'package:rehabox/src/theme/themedata.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';
import 'package:rehabox/src/screens/authentication/widgets/signup_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  static const String routeName = '/login';

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showingPassword = false;
  final _loginFormKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FF),
      appBar: AppBar(
        toolbarHeight: kAppbarHeight,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.4),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthPercent(0.03) + 8,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle.merge(
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: context.textScaleFactor(28),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomIconButton(
                    onPressed: (context) => Navigator.pop(context),
                    icon: SvgPicture.string(backSvgString),
                  ),
                  const SizedBox(width: 8),
                  Hero(
                    tag: 'email',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        'Continue with E-mail',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.textScaleFactor(28),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Form(
        key: _loginFormKey,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 8,
            bottom: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF040415),
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _emailController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDD0),
                      width: 2,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF3BA935),
                      width: 2,
                    ),
                  ),
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFCDCDD0),
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF040415),
                  ),
                  floatingLabelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF040415),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: !showingPassword,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF040415),
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: !showingPassword
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showingPassword = !showingPassword;
                      });
                    },
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDD0),
                      width: 2,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF3BA935),
                      width: 2,
                    ),
                  ),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFCDCDD0),
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF040415),
                  ),
                  floatingLabelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF040415),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: null,
                child: const Text('I forgot my password'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor:
                      MaterialStateProperty.all(const Color(0xFF686873)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.zero,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, SignupForm.routeName);
                    },
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(
                        theme.colorScheme.primaryContainer,
                      ),
                    ),
                    child: const Text(
                      'Don’t have an account? Let’s create!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: context.heightPercent(0.075),
                    child: ElevatedButton(
                      onPressed: () {
                        _loginFormKey.currentState?.save();
                        if (_loginFormKey.currentState != null &&
                            _loginFormKey.currentState!.validate()) {
                          loginUser();
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF3843FF),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
