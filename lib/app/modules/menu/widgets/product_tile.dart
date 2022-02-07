import 'package:flutter/material.dart';

import 'package:vakinha_burger_mobile/app/core/helpers/formater_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/model/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel model;
  final VoidCallback goToproductPage;
  const ProductTile({
    Key? key,
    required this.model,
    required this.goToproductPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToproductPage(),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "http://dartweek.academiadoflutter.com.br/images${model.image}",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      model.name,
                      style: VakinhaUi.textBold,
                    ),
                    Text(
                      FormaterHelper.formatCurrency(model.price),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
