import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:huntapp/app/models/product.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "JSHunt"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final HomeController _homeController = Modular.get();

  @override
  void initState() {
    super.initState();

    _homeController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return _homeController.products == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _homeController.products.length,
                  itemBuilder: (context, index) {
                    final Product product = _homeController.products[index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    );
                  },
                );
        },
      ),
    );
  }
}
