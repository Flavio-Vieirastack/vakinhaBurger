import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_app_bar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_text_form_field.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login",
                          style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        VakinhaTextFormField(
                          label: "Email",
                          textEditingController: controller.emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required("Email é obrigatório"),
                            Validatorless.email("Email inválido"),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        VakinhaTextFormField(
                          label: "Senha",
                          obscureText: true,
                          textEditingController: controller.passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required("Senha obrigatória"),
                            Validatorless.min(
                                6, "A senha deve conter mais de 6 caractéres"),
                          ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: VakinhaButtom(
                            width: context.width,
                            onpressed: () => controller.validate(
                              email: controller.emailEC.text,
                              password: controller.passwordEC.text,
                            ),
                            label: "Entrar",
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Não possui uma conta?"),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Constants.REGISTER_ROUTE);
                              },
                              child: const Text(
                                "Cadastre-se",
                                style: VakinhaUi.textBold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
