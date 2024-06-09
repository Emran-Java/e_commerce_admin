import 'package:e_commerce_admin_demo/controller/home_controller.dart';
import 'package:e_commerce_admin_demo/pages/add_product_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Footware admin"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].name ?? ''),
                subtitle: Text(ctrl.products[index].price ?? '0.0'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete), onPressed: () {
                    ctrl.deleteProduct(ctrl.products[index].id ?? '');
                  },
                ),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("click febButton");
            Get.to(AddProductPage());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
