import 'package:huntapp/app/modules/product/product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:huntapp/app/modules/product/product_page.dart';

class ProductModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductController()),
      ];

  @override
  List<Router> get routers => [
        Router('/:id', child: (_, args) => ProductPage(productId: args.params['id'],)),
      ];

  static Inject get to => Inject<ProductModule>.of();
}
