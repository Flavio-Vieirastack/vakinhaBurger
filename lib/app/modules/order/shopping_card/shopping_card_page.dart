import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/helpers/formater_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/PlusMinusBox/plus_minus_box.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/widgets/address_field.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/widgets/cpf_field.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/widgets/rive_animation.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  const ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> shopingCartFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: shopingCartFormKey,
                  child: Obx(() {
                    return Visibility(
                      visible: controller.products.isNotEmpty,
                      replacement: const RiveAnimation(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Carrinho",
                                  style: context.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => controller.clearCard(),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(() {
                            return Column(
                              children: controller.products.map(
                                (p) {
                                  return Container(
                                    margin: const EdgeInsets.all(10),
                                    child: PlusMinusBox(
                                      label: p.product.name,
                                      elevated: true,
                                      calculateTotal: true,
                                      backgroundColor: Colors.white,
                                      quantity: p.quantity,
                                      price: p.product.price,
                                      minusCallback: () => controller
                                          .subtractQuantityInProduct(p),
                                      plusCallback: () =>
                                          controller.addQuantityInProduct(p),
                                    ),
                                  );
                                },
                              ).toList(),
                            );
                          }),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total do pedido",
                                  style: context.textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Obx(() {
                                  return Text(
                                    FormaterHelper.formatCurrency(
                                        controller.totalValue),
                                    style:
                                        context.textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          const Divider(),
                          AddressField(
                            onchanged: (value) =>
                                controller.addresOnChanged(value),
                          ),
                          const Divider(),
                          CpfField(
                            onchanged: (value) =>
                                controller.cpfOnChanged(value),
                          ),
                          const Divider(),
                          const Spacer(),
                          Center(
                            child: SizedBox(
                              width: context.widthTransformer(reducedBy: 10),
                              child: VakinhaButtom(
                                onpressed: () => controller.createOrder(shopingCartFormKey),
                                label: "Finalizar",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
