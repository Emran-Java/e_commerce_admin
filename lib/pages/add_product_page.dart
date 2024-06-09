import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_admin_demo/controller/home_controller.dart';
import 'package:e_commerce_admin_demo/widgets/drop_down_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Product"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Add New Product",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.w600),
                ),

                //first field
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text("Product Name"),
                    hintText: "Enter yor product name",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //second
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text("Product Description"),
                    hintText: "Enter yor product description",
                  ),
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 10,
                ),

                //3rc field
                TextField(
                  controller: ctrl.productImageCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text("Image URL"),
                    hintText: "Enter yor image URL",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //4th field
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text("Product Price"),
                    hintText: "Enter product price",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //for two dropdown button
                Row(
                  children: [
                    Flexible(
                        child: DropDownBtn(
                          items: const ['Boots', 'Shoe', 'Beach Show', 'High heel'],
                          selectedItemText: ctrl.category,
                          onSelected: (selectedValue) {
                            ctrl.category = selectedValue ?? 'General';
                            ctrl.update();
                            print('Category: $selectedValue');
                          },
                        )),
                    Flexible(
                        child: DropDownBtn(
                          items: ['Puma', 'Sketchers', 'Adidas','Clarks'],
                          selectedItemText: ctrl.brand,
                          onSelected: (selectedValue) {
                            ctrl.brand = selectedValue ?? 'Un Brand';
                            ctrl.update();
                            print('Brand: $selectedValue');
                          },
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text("Offer Product?"),
                const SizedBox(
                  height: 10,
                ),

                DropDownBtn(
                  items: ['true', 'false'],
                  selectedItemText: ctrl.offer,
                  onSelected: (selectedValue) {
                    ctrl.offer = selectedValue ?? 'false';
                    ctrl.update();
                    print('Offer: $selectedValue');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    ctrl.addProduct();
                  },
                  child: Text("Add Product"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
