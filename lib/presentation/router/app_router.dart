import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../screens/login/login_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/user/user_profile.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logInScreen:
        return MaterialPageRoute(builder: (_) =>   LogInScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
       case userProfileScreen:
        return MaterialPageRoute(builder: (_) =>   UserProfileScreen());
      default:
        return null;
    }
  }
}