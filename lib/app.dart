import "package:bazora/features/catalog/blocs/catalog_page_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:bazora/core/extension/build_context_extension.dart";
import "package:bazora/core/l10n/app_localizations_setup.dart";
import "package:bazora/core/theme/themes.dart";
import "package:bazora/router/app_routes.dart";
import "package:bazora/injector_container.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<CatalogPageBloc>(create: (_) => sl<CatalogPageBloc>()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.options.themeMode,
          locale: Locale("en"),
          // supportedLocales: AppLocalizationsSetup.supportedLocales,
          // localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        ),
      );
}
