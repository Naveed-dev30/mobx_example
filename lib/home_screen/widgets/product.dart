import 'package:flutter/material.dart';
import 'package:mobx_example/modals/product_item.dart';

import 'image_view.dart';

class Product extends StatelessWidget {
  final ProductItem productItem;

  Product(this.productItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 3, color: Colors.black12, offset: Offset(3, 3)),
        ],
      ),
      child: ListTile(
        title: Text(
            '${productItem.tag.length > 15 ? productItem.tag.substring(0, 15) : productItem.tag} ${productItem.tag.length > 15 ? '...' : ''}'),
        subtitle: Text('${productItem.cost} \$'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PhotoView(productItem.url),
              ),
            );
          },
          child: Container(
            width: 30,
            child: Hero(
              tag: '${productItem.url}',
              child: Image.network(
                productItem.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        trailing: Container(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.purpleAccent,
                    onTap: () {
                      //Remove the item from list
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.remove_red_eye, color: Colors.red),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.purpleAccent,
                    onTap: () {
                      //Add the item to cart
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.shopping_cart, color: Colors.indigo),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
