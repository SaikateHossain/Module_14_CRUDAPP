import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _inprogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Add New Product', style: TextStyle(color: Colors.white, fontSize: 28)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: buildNewProductForm(),
        ),
      ),
    );
  }

  Widget buildNewProductForm() {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: _productNameTEController,
              decoration: InputDecoration(
                hintText: 'Name',
                labelText: 'Product Name',
              ),
              validator: (String ? value) {
                if(value == null || value.isEmpty) {
                  return 'Enter a valid value';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _unitPriceTEController,
              decoration: InputDecoration(
                hintText: 'Unite Price',
                labelText: 'Unite Price',
              ),
              validator: (String ? value) {
                if(value == null || value.isEmpty) {
                  return 'Enter a valid value';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _totalPriceTEController,
              decoration: InputDecoration(
                hintText: 'Total Price',
                labelText: 'Total Price',
              ),
              validator: (String ? value) {
                if(value == null || value.isEmpty) {
                  return 'Enter a valid value';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageTEController,
              decoration: InputDecoration(
                hintText: 'Image',
                labelText: 'Product Image',
              ),
              validator: (String ? value) {
                if(value == null || value.isEmpty) {
                  return 'Enter a valid value';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _productCodeTEController,
              decoration: InputDecoration(
                hintText: 'Product code',
                labelText: 'Product Code',
              ),
              validator: (String ? value) {
                if(value == null || value.isEmpty) {
                  return 'Enter a valid value';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantityTEController,
              decoration: InputDecoration(
                hintText: 'Quantity',
                labelText: 'Quantity',
              ),
              validator: (String ? value) {
                if(value == null || value.isEmpty) {
                  return 'Enter a valid value';
                }
                return null;
              },
            ),

            const SizedBox(height: 30),

            _inprogress ? Center(child: CircularProgressIndicator()) : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  fixedSize: Size.fromWidth(double.maxFinite),
                ),
                onPressed: _onTapAdProductButton,
                child: Text('Add Product', style: TextStyle(fontSize: 20)))
          ],
        ),
      );
  }

  void _onTapAdProductButton() {
if(_formkey.currentState!.validate()) {
  addNewProduct();
}
  }

  Future<void> addNewProduct() async {
    _inprogress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');

    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text,
      "ProductCode": _productCodeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
      "UnitPrice": _unitPriceTEController.text,
    };

    Response response = await post(uri,
headers: {
      'Content-Type': 'application/json'
},
        body: jsonEncode(requestBody));

    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200) {
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New product added')));
    }
    _inprogress = false;
    setState(() {});
  }

  void _clearTextFields() {
    _productNameTEController.clear();
    _unitPriceTEController.clear();
    _totalPriceTEController.clear();
    _imageTEController.clear();
    _productCodeTEController.clear();
    _quantityTEController.clear();
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    _productCodeTEController.dispose();
    _quantityTEController.dispose();
    super.dispose();
  }
}
