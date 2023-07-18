import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:webkul_task/view/loginView.dart';
import 'package:webkul_task/view/productView.dart';

import '../controller/cardController.dart';
import '../controller/productController.dart';
import '../model/productModel.dart';

class HomeView extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int hexColor = 0xFF36612F;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CartController _cartController = Get.put(CartController());
  // final CartController _cartController = Get.find();

  ProductController productctr = Get.put(ProductController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _logout(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ),
      );
    } catch (e) {

    }
  }
  @override
  void initState() {
    productctr.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF436B4E),
              ),
              child: Text(
                'User Name',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle tapping the Home menu item
                // Replace this line with your desired navigation logic.
                // For example, you can use Navigator.pushReplacementNamed
                // to navigate to the home page.
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF436B4E),
        elevation: 0,
        
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle search icon press
            },
          ),
          GetBuilder<CartController>(
            builder: (controller) => Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Navigate to the cart page or show a cart dialog.
                  },
                ),
                if (controller.cartItemCount.value > 0)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        controller.cartItemCount.value.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              // color: Colors.blue, // Background color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF436B4E), Color(0xFF436B4E)],
              ),
            ), // color: Colors.green,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                //AppBa
                Container(
                  margin: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Let's Grab Your \nfavorite Plants~",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(
                      bottom: 40.0, left: 20, right: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // color: Colors.white,
                      // Add padding around the search bar
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        // controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search your favorite plant',
                          // Add a clear button to the search bar
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.mic,
                            ),
                            onPressed: () {},
                            // onPressed: () => _searchController.clear(),
                          ),
                          // Add a search icon or button to the search bar
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  // color: Colors.blue, // Background color
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white60, Colors.white60],
                  ),
                ),
                child: Obx(() {
                  if (productctr.products.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return MasonryGridView.count(
                      // controller: controller.scrollController,
                      shrinkWrap: true,
                      itemCount: productctr.products.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, i) {
                        final ProductModel product = productctr.products[i];
                        return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              // Get.to(() => PostScreen(
                              //   post: controller.listOfPostsToShow[i],
                              //   author: user,
                              //   // isMyPost: isMyPost,
                              // ));
                            },
                            child: Card(
                              elevation: 4,
                              child: Column(
                                children: [
                                  Container(
                                      // height: i * 60,
                                      color: Colors.blueAccent,
                                      child: Container(
                                        child: Image.network(
                                          '${product.image?.toString()}',
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${product.title?.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          '${product.price?.toString()}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green[900],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductView(
                                                    title: product.title!
                                                        .toString(),
                                                    description: product
                                                        .description!
                                                        .toString(),
                                                    image: product.image!
                                                        .toString(),
                                                  ),
                                                ),
                                              );
                                              // Get.to(ProductView());
                                            },
                                            icon: Icon(
                                              Icons.arrow_circle_right,
                                              color: Colors.green[900],
                                              size: 35,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                        // child: Image.asset(controller.listOfPostsToShow[i].imgPath),
                      },
                    );
                  }
                })),
          )
        ],
      ),
    );
  }
}
