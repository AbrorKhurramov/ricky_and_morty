import 'package:example_app/bindings/main_bindings.dart';
import 'package:example_app/controller/home_controller.dart';
import 'package:example_app/provider/api_client.dart';
import 'package:example_app/views/character/characters_page.dart';
import 'package:example_app/views/episode/episode_page.dart';
import 'package:example_app/views/location/location_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

void onStart() {
  WidgetsFlutterBinding.ensureInitialized();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: ApiClient.alice.getNavigatorKey(),
      title: "Flutter Example",
      initialBinding: MainBindings(),
      theme:
          new ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:(controller)=> Scaffold(
        body: PageView(
          children: [
            CharactersPage(),
            LocationPage(),
            EpisodePage()
          ],
        ),
      ),
    );
  }
}
