import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gcglobal/HomePage/TripManagerPage/GCTripManagerPageView.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:gcglobal/HomePage/GCEditInfoPageView.dart';
import 'package:gcglobal/HomePage/GCEditPhonePageView.dart';
import 'package:gcglobal/HomePage/GCSettingPageView.dart';
import 'package:gcglobal/HomePage/HomePageView.dart';
import 'package:gcglobal/loginView/SignUpPage.dart';
import 'AddCustomPageView/GCAddCustomPageView.dart';
import 'GCNotifyDetailPageView/GCNotifyDetailPageView.dart';
import 'HomePage/AddInvoice/GCAddInvoicePageView.dart';
import 'HomePage/AddInvoice/GCConfirmDataPageView.dart';
import 'HomePage/AddInvoice/GCInvoiceDetailPageView.dart';
import 'HomePage/AddInvoice/GCSearchCustomPageView.dart';
import 'HomePage/AddXingCheng/GCAddTripAlertPageView.dart';
import 'HomePage/AddXingCheng/GCAddTripPageView.dart';
import 'HomePage/AddXingCheng/GCSelectTripPageView.dart';
import 'HomePage/GCEditNamePageView.dart';
import 'HomePage/GCLangSettingPageView.dart';
import 'HomePage/GCNotifyListPageView.dart';
import 'HomePage/GCNotifyPageView.dart';
import 'HomePage/GCQuickFunctionPageView/GCBusinessLoansPageView.dart';
import 'HomePage/GCQuickFunctionPageView/GCHouseCalculatePageView.dart';
import 'HomePage/GCQuickFunctionPageView/GCQuickFunctionPageView.dart';
import 'HomePage/GCQuickFunctionPageView/GCSelectCustomPageView.dart';
import 'HomePage/GCReportErrorPageView.dart';
import 'HomePage/GCResetPwdPageView.dart';
import 'HomePage/GCSearchHistoryPageView.dart';
import 'HomePage/GCSignNamePageView/GCSignNamePageView.dart';
import 'HomePage/HouseDataListPage/GCHouseDataDetailPageView.dart';
import 'HomePage/HouseDataListPage/HouseDataListPageView.dart';
import 'loginView/loginPage.dart';
import 'package:easy_localization/easy_localization.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(

    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('en-ch')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'ch'),
        child: MyApp()
    ),
  );
  configLoading();

}
void configLoading() {
  print("--------");
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750,1624),
        builder: ()=>MaterialApp(
        title: 'GCGlobal',
        theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      home: new Scaffold(
        body:GCHouseDataDetailPageView()
        //HouseDataListPageView()
        //GCTripManagerPageView()
        //GCSignNamePageView()
        //GCSelectCustomPageView()
        //GCBusinessLoansPageView()
        //GCHouseCalculatePageView()
        //GCInvoiceDetailPageView()
        //GCConfirmDataPageView(confirmModel: new GCConfirmModel(),)
        //GCSearchCustomPageView()
        //GCAddInvoicePageView()
        //GCAddTripAlertPageView()
        //GCSelectTripPageView()
        //GCAddTripPageView()
        //GCAddCustomPageView()
        //GCQuickFunctionPageView()
        //GCNotifyDetailPageView()
        //GCNotifyListPageView()
        //GCSearchHistoryPageView()
        //loginPage()
        //GCNotifyPageView()
        //GCNotifyPageView()
        //GCLangSettingPageView()
        //GCReportErrorPageView()
        //GCResetPwdPageView()
        // GCEditPhonePageView(phone: "88888888")
        // GCEditNamePageView(name:"name")
        //GCEditInfoPageView(avatarUrl: "assets/homepage/avatar/icon_touxiang_x@2x.png",userID: "123",userName: "測試",phoneNumber: "88888888",),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: [
        Locale('en'),
        Locale('en-ch'),
      ],
      locale: Locale('en'),
    ));
  }


}

