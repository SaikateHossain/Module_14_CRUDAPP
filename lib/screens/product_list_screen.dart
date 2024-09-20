import 'dart:convert';
import 'package:app_for_api_integration/screens/add_new_product_screen.dart';
import 'package:app_for_api_integration/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:app_for_api_integration/models/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<Product> productList = [];

  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Product list', style: TextStyle(color: Colors.white, fontSize: 28)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                getProductList();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
                size: 30,
              )
          )
        ],
      ),
      body: _inProgress ? Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddNewProductScreen();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    _inProgress = true;

    setState(() {});

    print('Requesting');
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {

      productList.clear();

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(id: item['_id'],
            productName: item['ProductName'] ?? '',
            productCode: item['ProductCode'] ?? '',
            productImage: item['Img'] ?? '',
            unitPrice: item['UnitPrice'] ?? '',
            quantity: item['Qty'] ?? '',
            totalPrice: item['TotalPrice'] ?? '',
            createdDate: item['CreatedDate'] ?? '',
        );
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }
}
