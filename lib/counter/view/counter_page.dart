import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_hour/app/view/router/app_router.dart';
import 'package:office_hour/app/view/theme/light_theme.dart';
import 'package:office_hour/app/view/theme/light_theme_blue.dart';
import 'package:office_hour/app/view/theme/light_theme_red.dart';
import 'package:office_hour/app/view/theme/light_theme_teal.dart';
import 'package:office_hour/app/view/theme/theme_cubit.dart';
import 'package:office_hour/app/view/widgets/social_button.dart';
import 'package:office_hour/counter/counter.dart';
import 'package:office_hour/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});
  static AppRoute route = AppRoute(path: '/counter_page', name: 'counter');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () {
                  context.changeTheme(LightTheme());
                },
                child: const Text('Primary Theme'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  context.changeTheme(LightThemeBlue());
                },
                child: const Text('Blue Theme'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  context.changeTheme(LightThemeRed());
                },
                child: const Text('Red Theme'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  context.changeTheme(LightThemeTeal());
                },
                child: const Text('Teal Theme'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('Enter Email'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                label: const Text('Enter Password'),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: SocialButton.google(
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton.google(
                  onTap: () {},
                  onlyIcon: true,
                ),
                SocialButton.google(
                  onTap: () {},
                  onlyIcon: true,
                ),
                SocialButton.google(
                  onTap: () {},
                  onlyIcon: true,
                ),
                SocialButton.google(
                  onTap: () {},
                  onlyIcon: true,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner_outlined,
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_history_outlined,
            ),
            label: 'Work History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
