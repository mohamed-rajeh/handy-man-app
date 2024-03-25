// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/components/constant/them.dart';
import 'package:ser/components/shared/my_button.dart';
import 'package:ser/components/shared/my_lable.dart';
import 'package:ser/components/shared/my_text_field.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
            title: Text("profileInfo".tr),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyLabel(text: "username".tr, minTextSize: 20),
                const SizedBox(height: 16),
                MyTextField(
                  borderColre: MyThem.secondaryColor,
                  hint: "userameHint".tr,
                  color: MyThem.white,
                ),
                const SizedBox(
                  height: 16,
                ),
                MyLabel(text: "password".tr, minTextSize: 20),
                const SizedBox(height: 16),
                MyTextField(
                  borderColre: MyThem.secondaryColor,
                  color: MyThem.white,
                  hint: "passwordHint".tr,
                ),
                const SizedBox(
                  height: 16,
                ),
                const RadioExample(),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: MyButton(
                    onTap: () {},
                    lable: "save".tr,
                    color: MyThem.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender { male, fmale }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  Gender? _character = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text('male'.tr),
            leading: Radio<Gender>(
              activeColor: MyThem.secondaryColor,
              value: Gender.male,
              groupValue: _character,
              onChanged: (Gender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text('fmale'.tr),
            leading: Radio<Gender>(
              activeColor: MyThem.secondaryColor,
              value: Gender.fmale,
              groupValue: _character,
              onChanged: (Gender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
