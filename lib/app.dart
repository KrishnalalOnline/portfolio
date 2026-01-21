import 'package:flutter/material.dart';
import 'package:new_portfolio/core/di/injection.dart';
import 'package:new_portfolio/core/routing/app_router.dart.dart' as AppRouter;
import 'package:new_portfolio/core/theme/app_theme.dart';

enum AppFlavor { dev, prod }

late AppFlavor appFlavor;

void bootstrap(AppFlavor flavor) {
  appFlavor = flavor;
  configureDependencies();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Krishnalal A K',
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: appFlavor == AppFlavor.dev,
    );
  }
}
