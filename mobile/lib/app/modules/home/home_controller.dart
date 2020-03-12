import 'package:flutter_modular/flutter_modular.dart';
import 'package:huntapp/app/models/product.dart';
import 'package:huntapp/app/services/product_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final ProductService _productService = Modular.get();

  @observable
  List<Product> products;

  @action
  Future<void> getProducts() async {
    this.products = await _productService.getPoducts();
  }

}
