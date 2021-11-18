import 'package:example_app/controllers/product_controller.dart';
import 'package:example_app/views/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLutter Example",
      theme:
          new ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "ShopX",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                )),
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if(productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
            }),
          )
        ],
      ),
    );
  }
}
