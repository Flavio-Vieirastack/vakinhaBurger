import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_app_bar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_text_form_field.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
                    "Cadastro",
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    "Preencha o campo a baixo para criar o seu cadastro",
                    style: context.textTheme.bodyText1?.copyWith(
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VakinhaTextFormField(
                    label: "Nome",
                    textEditingController: controller.nameEC,
                    validator: Validatorless.required("Nome obrigatório"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VakinhaTextFormField(
                    label: "Email",
                    textEditingController: controller.emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required("Email obrigatório"),
                      Validatorless.email("Email inválido"),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VakinhaTextFormField(
                    label: "Senha",
                    textEditingController: controller.passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required("Senha obrigatória"),
                      Validatorless.min(
                          6, "A senha deve conter mais de 6 carácteres")
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VakinhaTextFormField(
                    label: "Confirmar senha",
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required(
                        "Confirmação de senha obrigatória",
                      ),
                      Validatorless.min(
                        6,
                        "A senha deve conter mais de 6 carácteres",
                      ),
                      Validatorless.compare(
                        controller.passwordEC,
                        "As senhas não conferem",
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: VakinhaButtom(
                      width: context.width,
                      onpressed: () => controller.registerValidate(
                        email: controller.emailEC.text,
                        name: controller.nameEC.text,
                        password: controller.passwordEC.text,
                      ),
                      label: "Cadastrar",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
