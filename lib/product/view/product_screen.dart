import 'package:delivery/common/component/pagination_list_view.dart';
import 'package:delivery/product/component/product_card.dart';
import 'package:delivery/product/model/product_model.dart';
import 'package:delivery/product/provider/product_provider.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationListView<ProductModel>(
      provider: productProvider,
      itemBuilder: <ProductModel>(_, index, model) {
        return ProductCard.fromProductModel(
          model: model,
        );
      },
    );
  }
}
