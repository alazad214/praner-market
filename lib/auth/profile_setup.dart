import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:praner_market/controllers/auth_controllers.dart';
import 'package:praner_market/widgets/custom_title_subtitle.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textField.dart';

class Profile_setup extends StatelessWidget {
  Profile_setup({super.key});
  final _emailformkey = GlobalKey<FormState>();
  final _nameformkey = GlobalKey<FormState>();
  final _numberformkey = GlobalKey<FormState>();
  final _addressformkey = GlobalKey<FormState>();

  final controller = Get.put(Auth_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              const Custom_Title_SubTitle(
                  title: "Profile Setup",
                  subtitle: "Complete your profile & enjoy this app!"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Form(
                      key: _emailformkey,
                      child: Custom_formField(
                        prefixicon: Icons.email,
                        onchanged: (emeil) {
                          controller.email.value = emeil;
                        },
                        hinttext: "Email",
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Fill The Form";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _nameformkey,
                      child: Custom_formField(
                        prefixicon: Icons.drive_file_rename_outline_rounded,
                        hinttext: "Name",
                        onchanged: (name) {
                          controller.name.value = name;
                        },
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Fill The Form";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _numberformkey,
                      child: Custom_formField(
                        prefixicon: Icons.phone,
                        hinttext: "Phone number",
                        onchanged: (phone) {
                          controller.phone.value = phone;
                        },
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Fill The Form";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _addressformkey,
                      child: Custom_formField(
                        prefixicon: Icons.location_on,
                        hinttext: "address",
                        onchanged: (address) {
                          controller.address.value = address;
                        },
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Fill The Form";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                        height:
                            20), // Add some space between TextFormField and Button
                    Custom_Button(
                      text: "Complete",
                      ontap: () {
                        if (_emailformkey.currentState!.validate() &&
                            _nameformkey.currentState!.validate() &&
                            _numberformkey.currentState!.validate() &&
                            _addressformkey.currentState!.validate()) {
                          controller.profile_();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
