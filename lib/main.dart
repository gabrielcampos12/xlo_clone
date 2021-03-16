import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo/screens/base/base_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/stores/page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());

}
void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
      'inDg3bai92pXq92clm7PDRNp9mzswRVvmtUOUKSF',
      'https://parseapi.back4app.com/',
      clientKey: 'xc2IjtNFRSbnrjQyj97SkywKXLpjS2acK5L6oEzS',
      autoSendSessionId: true,
      debug: true
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orange,
      ),

      home: BaseScreen(),
    );
  }
}


