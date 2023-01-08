import 'package:flutter/material.dart';

import 'package:loja_virtual/src/configs/custom_dors.dart';
import 'package:loja_virtual/src/pages/commom_widgets/custom_text_fields.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SingUpPage extends StatelessWidget {
  SingUpPage({Key? key}) : super(key: key);

  final cpfFormateter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});

  final phoneFormateter = MaskTextInputFormatter(
      mask: '## # ####-####', filter: {'#': RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customConstrastColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                      child: Center(
                    child: Text(
                      'Cadastro',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  )),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 42,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                            icon: Icons.email, label: 'E-mail'),
                        const CustomTextField(
                            icon: Icons.lock, label: 'Senha', isScecret: true),
                        const CustomTextField(
                            icon: Icons.person, label: 'Nome'),
                        CustomTextField(
                            icon: Icons.phone,
                            label: 'Celular',
                            inputFormater: [phoneFormateter]),
                        CustomTextField(
                            icon: Icons.file_copy,
                            label: 'CPF',
                            inputFormater: [cpfFormateter]),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {},
                              child: const Text(
                                'Cadastrar Usuario',
                                style: TextStyle(fontSize: 18),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
