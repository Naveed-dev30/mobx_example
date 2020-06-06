import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx_example/home_screen/widgets/cart.dart';
import 'package:mobx_example/home_screen/widgets/product.dart';
import 'package:mobx_example/modals/product_item.dart';

class HomeScreen extends StatelessWidget {
  //Function that gets fake data using dio library
  Future<List<ProductItem>> getData() async {
    final url = "https://fakestoreapi.com/products?limit=30";
    final dio = Dio();
    final result = await dio.get('$url');
    final jsonList = List<Map<String, dynamic>>.from(result.data);
    var products = <ProductItem>[];
    try {
      for (final json in jsonList) {
        products.add(
          ProductItem(
            cost: double.tryParse(json['price'].toString()),
            tag: json['title'],
            url: json['image'],
          ),
        );
      }
    } catch (e) {
      print('Error encountered: $e');
      //product items are sample local data
      return productItems;
    }

    return products;
  }

  var cartProducts = <ProductItem>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX demo'),
        centerTitle: true,
        actions: [Cart(cartProducts)],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (_, AsyncSnapshot<List<ProductItem>> snap) => snap.hasData
            ? ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (_, index) => Product(snap.data[index]),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
