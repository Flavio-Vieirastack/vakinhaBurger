import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CpfField extends StatelessWidget {
  final Function(String)? onchanged;
  const CpfField({
    Key? key,
    required this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 35,
            child: Text(
              "CPF",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => onchanged!(value),
            validator: Validatorless.multiple([
              Validatorless.required("Cpf obrigatório"),
              Validatorless.cpf("CPF inválido"),
            ]),
            decoration: const InputDecoration(
              hintText: "Digite seu CPF",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
