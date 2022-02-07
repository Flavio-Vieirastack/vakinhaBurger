import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/shopping_card_controller.dart';

class RiveAnimation extends GetView<ShoppingCardController> {
  const RiveAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: LottieBuilder.asset(
            Constants.LOTTIE_ANIMATION_ASSET,
            height: 500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Seu carrinho está vazio",
          style: VakinhaUi.textBold,
        )
      ],
    );
  }
}
