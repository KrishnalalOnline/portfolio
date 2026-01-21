import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
  ],
);
