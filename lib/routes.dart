import 'package:crud_database_provider/screens/add_data_page_view.dart';
import 'package:crud_database_provider/screens/home_page_view.dart';
import 'package:crud_database_provider/screens/login_page_view.dart';
import 'package:crud_database_provider/screens/register_page_view.dart';
import 'package:crud_database_provider/screens/splash_page_view.dart';
import 'package:crud_database_provider/wrapper.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/wrapper': (context) => const Wrapper(),
  '/splash': (context) => const SplashPageView(),
  '/login': (context) => const LoginPageView(),
  '/register': (context) => const RegisterPageView(),
  '/': (context) => const HomePageView(),
  '/add': (context) => const AddDataPageView(),
};