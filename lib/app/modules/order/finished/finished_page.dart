import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/modules/order/finished/finished_controller.dart';

class FinishedPage extends GetView<FinishedController> {
  const FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  Constants.LOGO_ASSET_ROUNDER,
                  height: context.heightTransformer(reducedBy: 70),
                  width: context.widthTransformer(reducedBy: 50),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Pedido realizado com sucesso, clique no botão a baixo para acessar o QRCode do pix",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: VakinhaButtom(
                    onpressed: () {
                      Get.toNamed(Constants.PIX_ROUTE, arguments: controller.orderPix);
                    },
                    label: "Pix",
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: context.widthTransformer(reducedBy: 10),
                  child: VakinhaButtom(
                    onpressed: () => controller.goToHomePage(),
                    label: "Fechar",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
