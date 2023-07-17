import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cardController.dart';
import '../controller/productController.dart';

class ProductView extends StatefulWidget {
  late String title;
  late String description;
  late String image;

  ProductView({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  // ProductView({required this.title, required this.description, required this.image});
  final ProductDetailController _productDetailController =
      Get.put(ProductDetailController());

  // CartController cardctr =Get.put(CartController());
  final CartController _cartController = Get.find();

  // final CartController _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    _productDetailController.setProductDetail(widget.title, widget.description, widget.image);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Define the action when the back arrow is pressed
                  },
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child:  Image.network(
                 widget.image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context)
                      .size
                      .width,
                )
              // child: Image.asset(
              //   "assets/images/Burger.png",
              //   fit: BoxFit.cover,
              // ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(

                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.sunny,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  Text(
                    "20-28 c ",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.cloud,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  Text(
                    "outdoor ",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  Text(
                    "yogyakarta ",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      widget.description ?? '',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.message,
                color: Colors.green,
                size: 25,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                _cartController.addToCart();



                _showSnackbar(context);
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(20)),
                child: Text("Add to Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _showSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('add to  card !'),
      duration: Duration(seconds: 3), // Duration for which the Snackbar is displayed
      action: SnackBarAction(
        label: 'CLOSE',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

