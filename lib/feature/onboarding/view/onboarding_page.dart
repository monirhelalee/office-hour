import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:office_hour/app/view/router/app_router.dart';
import 'package:office_hour/app/view/theme/theme_cubit.dart';
import 'package:office_hour/app/view/widgets/social_button.dart';
import 'package:office_hour/counter/counter.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  static AppRoute route = AppRoute(
    path: '/onboarding_page',
    name: 'onboarding',
  );

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var _activeIndex = 0;
  final pb = PocketBase('http://127.0.0.1:8090');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _CarouselWidget(
                onPageChanged: (index) {
                  setState(() {
                    _activeIndex = index;
                  });
                },
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: _activeIndex,
              count: _carouselItems.length,
              effect: WormEffect(
                activeDotColor: context.colors.primary,
                dotColor: context.colors.surface300,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            _SocialSignInOption(
              onAppleLogin: () {},
              onGoogolLogin: () async {
                final authData = await pb.collection('users').authWithOAuth2(
                  'google',
                  (url) async {
                    await launchUrl(url);
                  },
                );
                if (authData.token.isNotEmpty) {
                  context.go(CounterPage.route.path);
                }
              },
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
                child: SocialButton.email(onTap: onEmailLogin),
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

class CarouselItem {
  const CarouselItem({
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final IconData icon;
  final String title;
  final String subTitle;
}

final _carouselItems = <CarouselItem>[
  const CarouselItem(
    icon: Icons.access_alarm_outlined,
    title: 'Welcome to OfficeHour',
    subTitle: 'Simple, anonymous chat with your coworkers',
  ),
  const CarouselItem(
    icon: Icons.ac_unit_rounded,
    title: 'Safe and Anonymous',
    subTitle:
        "Don't worry, your identity is always protected. Feel free to express yourself!",
  ),
  const CarouselItem(
    icon: Icons.account_balance_wallet_outlined,
    title: 'More than just chat',
    subTitle:
        'Enjoy fun features like polls, Q&A sessions, and anonymous feedback.',
  ),
];

class _CarouselWidget extends StatefulWidget {
  const _CarouselWidget({required this.onPageChanged, super.key});

  final ValueChanged<int> onPageChanged;

  @override
  State<_CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<_CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      key: widget.key,
      itemCount: _carouselItems.length,
      itemBuilder: (context, index, realIndex) {
        final item = _carouselItems[index];
        return Column(
          spacing: 6,
          children: [
            const Spacer(),
            Icon(
              item.icon,
              size: MediaQuery.sizeOf(context).width - 175,
              color: context.colors.primary,
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                item.subTitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        aspectRatio: 1,
        viewportFraction: 1,
        enlargeFactor: 0,
        autoPlay: true,
        onPageChanged: (index, _) {
          widget.onPageChanged.call(index);
        },
      ),
    );
  }
}
