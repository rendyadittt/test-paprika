import 'package:get/get.dart';
import 'package:test_paprika/model/advertising_model.dart';
import 'package:test_paprika/pages/advertising/advertising_page.dart';
import 'package:test_paprika/pages/history/history_page.dart';
import 'package:test_paprika/pages/home/home_page.dart';
import 'package:test_paprika/routes/routes_name.dart';
class AppPages {
  AppPages._();

  // static const INITIAL = RoutesName.splash;
  static final pages = [
    GetPage(
        name: RoutesName.home,
        page: () => HomePage(),
        transition: Transition.fade),
    GetPage(
        name: RoutesName.history,
        page: () => HistoryPage(),
        transition: Transition.fade),
    GetPage(
        name: RoutesName.advertising,
        page: () => AdvertisingPage(model: Advertising(image: "", desc: ""),),
        transition: Transition.fade),
  ];
}
