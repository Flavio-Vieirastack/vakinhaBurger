import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  Constants.LANCHE_ASSET,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset(Constants.LOGO_ASSET),
                  const SizedBox(
                    height: 60,
                  ),
                  VakinhaButtom(
                    height: 35,
                    width: context.widthTransformer(reducedBy: 40),
                    onpressed: () => controller.checkedlogged(),
                    label: "Acessar",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
