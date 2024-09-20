import 'package:app_for_api_integration/models/product.dart';
import 'package:app_for_api_integration/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.green.shade50,
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Price: \$${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price: \$${product.totalPrice}'),
          Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return UpdateProductScreen();
                      }),
                    );
                  },
                  icon: Icon(Icons.edit, color: Colors.green.shade400),
                  label: Text('Edit', style: TextStyle(color: Colors.green),)),

              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.red.shade400,),
                  label: Text('Delete', style: TextStyle(color: Colors.red),)),
            ],
          )
        ],
      ),
    );
  }
}
