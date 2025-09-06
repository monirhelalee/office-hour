import 'package:go_router/go_router.dart';
import 'package:office_hour/counter/view/counter_page.dart';
import 'package:office_hour/feature/onboarding/view/onboarding_page.dart';

class AppRoute {
  AppRoute({required this.path, required this.name});
  final String path;
  final String name;
}

class AppRouter {
  static final GoRouter _goRouter = GoRouter(
    initialLocation: OnboardingPage.route.path,
    routes: [
      GoRoute(
        path: OnboardingPage.route.path,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: CounterPage.route.path,
        builder: (context, state) => const CounterPage(),
      ),
    ],
  );

  static GoRouter get router => _goRouter;
}
