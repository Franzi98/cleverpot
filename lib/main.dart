import 'package:cleverpot/Activity/home.dart';
import 'package:cleverpot/Activity/signin.dart';
import 'package:cleverpot/Utily/myThemes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text(
            "ERRORE",
            textDirection: TextDirection.ltr,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (user == null) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: Signup());
          } else {
            print(user.email);
            return MaterialApp(
              darkTheme: MyThemes.darkTheme,
              debugShowCheckedModeBanner: false,
              home: Home(),
            );
          }
        }

        //TODO: Pagina di caricamento
        return const Text(
          "Loading",
          textDirection: TextDirection.ltr,
        );
      },
    );
  }
}
