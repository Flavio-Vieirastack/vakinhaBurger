import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class AddressField extends StatelessWidget {
  final Function(String)? onchanged;
  const AddressField({
    Key? key,
    this.onchanged,
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
              "Endereço de entrega",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => onchanged!(value),
            validator: Validatorless.required("Endereço obrigatório"),
            decoration: const InputDecoration(
              hintText: "Digite um endereço",
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
