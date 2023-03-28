import 'package:crud_database_provider/providers/home_provider.dart';
import 'package:crud_database_provider/routes.dart';
import 'package:crud_database_provider/screens/home_page_view.dart';
import 'package:crud_database_provider/screens/login_page_view.dart';
import 'package:crud_database_provider/screens/register_page_view.dart';
import 'package:crud_database_provider/screens/splash_page_view.dart';
import 'package:crud_database_provider/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: appRoutes,
      ),
    );
  }
}
