// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductControllerBase, Store {
  final _$productAtom = Atom(name: '_ProductControllerBase.product');

  @override
  Product get product {
    _$productAtom.context.enforceReadPolicy(_$productAtom);
    _$productAtom.reportObserved();
    return super.product;
  }

  @override
  set product(Product value) {
    _$productAtom.context.conditionallyRunInAction(() {
      super.product = value;
      _$productAtom.reportChanged();
    }, _$productAtom, name: '${_$productAtom.name}_set');
  }

  final _$getProductByIdAsyncAction = AsyncAction('getProductById');

  @override
  Future<void> getProductById(String id) {
    return _$getProductByIdAsyncAction.run(() => super.getProductById(id));
  }

  @override
  String toString() {
    final string = 'product: ${product.toString()}';
    return '{$string}';
  }
}
