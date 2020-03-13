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
      backgroundColor: Color(0xfffafafa),
      body: Observer(
        builder: (_) {
          return _homeController.products == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RefreshIndicator(
                    child: ListView.builder(
                      itemCount: _homeController.products.length,
                      itemBuilder: (context, index) {
                        final Product product = _homeController.products[index];
                        return getProductItem(product);
                      },
                    ),
                    onRefresh: () async {
                      await _homeController.getProducts();
                    },
                  ),
                );
        },
      ),
    );
  }

  Widget getProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Text(product.title),
                subtitle: Text(product.description),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(bottom: 20, top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: RaisedButton(
                  color: Color(0xffda552f),
                  onPressed: () {
                    Modular.to.pushNamed('/product/${product.id}');
                  },
                  child: const Text(
                    'Acessar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
