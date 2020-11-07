import 'package:flutter/material.dart';
import 'package:forsat/application/repositories/auth_repository.dart';
import 'package:forsat/application/repositories/forum_repository.dart';
import 'package:forsat/application/repositories/opportunity_repository.dart';
import 'package:forsat/application/state/auth_state.dart';
import 'package:forsat/application/state/forum_state.dart';
import 'package:forsat/application/state/opportunity_state.dart';
import 'package:forsat/application/storage/localstorage.dart';
import 'package:forsat/application/storage/storage_keys.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/router/router.dart' as AppRouter;
import 'package:forsat/values/branding_color.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreferences();
  runApp(Forsat());
}

class Forsat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<AuthState>(() => AuthState(AuthRepositoryImpl())),
        Inject<OpportunityState>(
            () => OpportunityState(OpportunityRepositoryImpl())),
        Inject<ForumState>(() => ForumState(ForumRepositoryImpl())),
      ],
      builder: (context) {
        return MaterialApp(
          title: 'Forsat',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Dosis',
            primarySwatch: brandingColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: AppRouter.Router.onGenerateRoute,
          initialRoute:
              LocalStorage.getItem(TOKEN) != null ? homeRoute : signInRoute,
        );
      },
    );
  }
}
