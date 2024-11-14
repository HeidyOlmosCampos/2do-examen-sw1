import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/domain/use_cases/index.dart';
import 'package:flutter_template/infrastructure/data_sources/index.dart';
import 'package:flutter_template/infrastructure/repositories/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';
import 'package:flutter_template/presentation/routes/application_routes.dart';
import 'package:flutter_template/share_preferens/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authenticationDataSource = AuthenticationDataSourceImpl();

  final prefs = UserPreferences();
  await prefs.initPrefs();

  final authenticationRepository =
      AuthenticationRepositoryImpl(authenticationDataSource);

  final authenticationUseCase =
      AuthenticationUseCaseImpl(authenticationRepository);

  final emergencyDataSource = EmergencyDataSourceImpl();
  final emergencyRepository = EmergencyRepositoryImpl(emergencyDataSource);
  final emergencyUseCase = EmergencyUseCaseImpl(emergencyRepository);


  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  runApp(MyApp(
    navigatorKey: navigatorKey,
    authenticationUseCase: authenticationUseCase,
    emergencyUseCase: emergencyUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthenticationUseCase authenticationUseCase;
  final EmergencyUseCase emergencyUseCase;

  // ignore: use_super_parameters
  const MyApp({
    Key? key,
    required this.navigatorKey,
    required this.authenticationUseCase,
    required this.emergencyUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(authenticationUseCase),
        ),
        ChangeNotifierProvider(
          create: (_) => EmergencyProvider(emergencyUseCase),
        ),
        ChangeNotifierProvider(
          create: (_) => EmergencyImageProvider(emergencyUseCase),
        ),
        ChangeNotifierProvider(
          create: (_) => ActionProvider(emergencyUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'Bomber-App',
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(navigatorKey),
        initialRoute: '/',
        navigatorKey: navigatorKey,
      ),
    );
  }
}
