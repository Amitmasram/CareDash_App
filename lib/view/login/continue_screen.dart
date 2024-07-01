import 'package:CareDash/widgets/custom_button.dart';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../core/helpers/helper.dart';
import '../../core/utils/text_styles.dart';
import '../verify/otp_verify_screen.dart';

class ContinueScreen extends StatefulWidget {
  const ContinueScreen({super.key});

  @override
  State<ContinueScreen> createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String currentCountryCode = '+91';
    TextEditingController mobileController = TextEditingController();
    return Scaffold(
      backgroundColor: dark ? AppColors.dark : AppColors.light,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.170,
              ),
              Text(
                AppTexts.mobileNo,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                AppTexts.submobileNo,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          onSelect: (val) {
                            setState(() {
                              currentCountryCode = '+${val.phoneCode}';
                            });
                          });
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.darkGrey),
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        currentCountryCode,
                        style: AppTextStyles.bodyText
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: height * 0.06,
                      width: width * 0.64,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        cursorColor: AppColors.primary,
                        style: AppTextStyles.bodyText1
                            .copyWith(color: AppColors.black),
                        controller: mobileController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Mobile number",
                            hintStyle: AppTextStyles.bodyText,
                            // hintStyle: textTheme.bodySmall,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: AppColors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: AppColors.primary)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: AppColors.darkGrey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: AppColors.grey))),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpVerifyScreen()));
                  },
                  height: height * 0.06,
                  width: width * 0.75,
                  color: AppColors.primary,
                  text: AppTexts.tContinue)
            ],
          ),
        ),
      )),
    );
  }
}
