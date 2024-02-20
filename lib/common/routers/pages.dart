import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/page/application/application_view.dart';
import 'package:tin_flutter_book/page/book_detail/book_detail_view.dart';
import 'package:tin_flutter_book/page/book_reader/book_reader_view.dart';
import 'package:tin_flutter_book/page/reader/reader_view.dart';
import 'package:tin_flutter_book/page/register/register_view.dart';

import '../../page/book_main/book_main_view.dart';
import '../../page/sign_in/sign_in_view.dart';
import '../../page/welcome/welcome_view.dart';
import '../middlewares/middlewares.dart';
import 'routes.dart';


class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  ///别名映射页面
  static final routes = [

    GetPage(
      name: AppRoutes.INITIAL,
      page: () =>  WelcomePage(),
      transition: Transition.zoom,
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),


    GetPage(
      name: AppRoutes.SING_IN,
      page: () => SignInPage(),
    ),

    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
    ),

    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    GetPage(
      name: AppRoutes.bookDetail,
      page: () => BookDetailPage(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    GetPage(
      name: AppRoutes.reader,
      page: () => ReaderPage(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    GetPage(
      name: AppRoutes.bookReader,
      page: () => BookReaderPage(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),



    GetPage(
      name: AppRoutes.bookMain,
      page: () => BookMainPage(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

  ];



}
