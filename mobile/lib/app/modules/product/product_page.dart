import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';
import 'product_controller.dart';

class ProductPage extends StatefulWidget {
  final String title;
  final String productId;
  const ProductPage({Key key, this.title = "Product", this.productId})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ModularState<ProductPage, ProductController> {
  final ProductController _productController = Modular.get();

  @override
  void initState() {
    super.initState();

    _productController.getProductById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffafafa),
      body: Observer(
        builder: (_) {
          return _productController.product == null
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Text(
                        _productController.product.title,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        _productController.product.description,
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          await launch(_productController.product.url);
                        },
                        child: Text(
                          'URL: ${_productController.product.url}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff069696),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
