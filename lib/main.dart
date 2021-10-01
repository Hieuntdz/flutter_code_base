import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/di/injector.dart';
import 'package:flutter_code_base/generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/config.dart';
import 'constants/constants.dart';
import 'presentation/blocs/blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().configApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppInjector.injector<AppBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base Project',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: AppRoutes.getRoute,
        initialRoute: RouteConstants.splash,
        theme: AppTheme.light,
        builder: EasyLoading.init(),

      ),
    );
  }
}
