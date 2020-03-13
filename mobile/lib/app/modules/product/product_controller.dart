import 'package:flutter_modular/flutter_modular.dart';
import 'package:huntapp/app/models/product.dart';
import 'package:huntapp/app/services/product_service.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {

  final ProductService _productService = Modular.get();
  
  @observable
  Product product;

  @action
  Future<void> getProductById(String id) async {
    this.product = await _productService.getProductById(id);
  }
}
