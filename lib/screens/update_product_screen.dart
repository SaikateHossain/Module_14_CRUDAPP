import 'package:flutter/material.dart';


class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
  TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: buildNewProductForm(),
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
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: InputDecoration(
              hintText: 'Unite Price',
              labelText: 'Unite Price',
            ),
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price',
            ),
          ),
          TextFormField(
            controller: _imageTEController,
            decoration: InputDecoration(
              hintText: 'Image',
              labelText: 'Product Image',
            ),
          ),
          TextFormField(
            controller: _productCodeTEController,
            decoration: InputDecoration(
              hintText: 'Product code',
              labelText: 'Product Code',
            ),
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: InputDecoration(
              hintText: 'Quantity',
              labelText: 'Quantity',
            ),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                fixedSize: Size.fromWidth(double.maxFinite),
              ),
              onPressed: _onTapAdProductButton,
              child: Text('UPDATE'))
        ],
      ),
    );
  }

  void _onTapAdProductButton() {

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
