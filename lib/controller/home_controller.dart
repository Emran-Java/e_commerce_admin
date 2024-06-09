import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_demo/model/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = "general";
  String brand = "un brand";
  String offer = "false";

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = fireStore.collection('products');
    await fetchProducts();

    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference docFef = productCollection.doc();
      Product product = Product(
        id: docFef.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: productPriceCtrl.text,
        image: productImageCtrl.text,
        brand: brand,
        offer: offer,
      );

      final productJson = product.toJson();
      docFef.set(productJson);

      Get.snackbar('Success', 'Product save success', colorText: Colors.green);
      setValuesDefault();

    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  setValuesDefault() {
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productImageCtrl.clear();
    productPriceCtrl.clear();

    category = "general";
    brand = "un brand";
    offer = "false";

    update();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productsSnapshot = await productCollection.get();

      final List<Product> retrievedProducts = productsSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar("Info", "Total number of data ${products.length}", colorText: Colors.indigoAccent);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
    }
    finally{
      update();
    }
  }

  deleteProduct(String id) async{
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
    }
  }


}
