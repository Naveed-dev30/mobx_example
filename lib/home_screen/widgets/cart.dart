import 'package:flutter/material.dart';
import 'package:mobx_example/modals/product_item.dart';

class Cart extends StatelessWidget {
  final List<ProductItem> cartProducts;
  Cart(this.cartProducts);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Icon(Icons.add_shopping_cart),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: cartProducts.length > 0
                ? Colors.yellowAccent
                : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              cartProducts.length > 0 ? '${cartProducts.length}' : '',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
