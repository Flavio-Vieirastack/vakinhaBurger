import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/helpers/formater_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_app_bar.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/order/pix/pix_controller.dart';

class PixPage extends GetView<PixController> {
  const PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Valor a pagar",
                  style: context.textTheme.headline4,
                ),
                Text(
                  FormaterHelper.formatCurrency(controller.getOrder().totalValue),
                  style: context.textTheme.headline4?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
                Image.memory(
                  controller.getImageUri()!.contentAsBytes(),
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 50),
                ),
                TextButton(
                  onPressed: () => controller.copyPixCode(),
                  style: TextButton.styleFrom(primary: Colors.grey),
                  child: Text(
                    "Pix copia e cola",
                    style: context.textTheme.headline4?.copyWith(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
