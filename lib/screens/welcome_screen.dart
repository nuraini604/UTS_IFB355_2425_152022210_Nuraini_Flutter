import 'package:flutter/material.dart';
import 'package:login_signup/screens/signin_screen.dart';
import 'package:login_signup/widgets/custom_scaffold.dart';
import 'package:login_signup/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Spacer(flex: 3),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Container(
                  width: 300, // Reverted to previous width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: WelcomeButton(
                    buttonText: 'Get Started',
                    onTap: () {
                      Navigator.of(context).push(_transitionAnimation(context, const SignInScreen()));
                    },
                    color: Colors.deepOrange[800]!,
                    textColor: Colors.white,
                    fontSize: 22, // Adjust font size as needed
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Route _transitionAnimation(BuildContext context, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from right to left
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
