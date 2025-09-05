import 'package:flutter/material.dart';
import 'package:office_hour/app/view/theme/theme_cubit.dart';
import 'package:office_hour/app/view/widgets/social_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Background(
        child: Column(
          children: [
            const Spacer(),
            _SocialSignInOption(
              onAppleLogin: () {},
              onGoogolLogin: () {},
              onEmailLogin: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.colors.surface100,
              context.colors.primary6th,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}

class _SocialSignInOption extends StatelessWidget {
  const _SocialSignInOption({
    required this.onGoogolLogin,
    required this.onAppleLogin,
    required this.onEmailLogin,
  });

  final VoidCallback onAppleLogin;
  final VoidCallback onGoogolLogin;
  final VoidCallback onEmailLogin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            spacing: 12,
            children: [
              const _Divider(),
              SizedBox(
                width: double.maxFinite,
                child: SocialButton.apple(onTap: onAppleLogin),
              ),
              SizedBox(
                width: double.maxFinite,
                child: SocialButton.google(onTap: onGoogolLogin),
              ),
              SizedBox(
                width: double.maxFinite,
                child: SocialButton.google(onTap: onEmailLogin),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Divider(
        color: context.colors.surface200,
        thickness: 5,
        height: 36,
      ),
    );
  }
}
