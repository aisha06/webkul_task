import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/productModel.dart';
class ProductController extends GetxController{

  RxList<ProductModel> products = <ProductModel>[].obs;

  RxBool islegderCalled = false.obs;
  @override
  void onInit() {
    super.onInit();
    print("cal fun");
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    print("start");
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products/'));
      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body) as List<dynamic>;
        products.value = jsonData.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  }



class ProductDetailController extends GetxController {
  var productDetail = ProductDetailModel(title: '', description: '', image: '').obs;

  void setProductDetail(String title, String description, String image) {
    productDetail.value = ProductDetailModel(title: title, description: description, image: image);
  }
}