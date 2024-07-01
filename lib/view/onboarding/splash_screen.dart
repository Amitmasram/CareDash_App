import 'package:CareDash/core/utils/text_styles.dart';
import 'package:CareDash/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../core/helpers/helper.dart';
import '../login/continue_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: dark ? AppColors.dark : AppColors.light,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  height: height * 0.3,
                  width: width * 5,
                  child: Image.asset(
                    'assets/blue.gif',
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppTexts.onBoardingTitle1,
                  style: AppTextStyles.headline,
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppTexts.onBoardingSubTitle1,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.079,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContinueScreen()));
                    },
                    height: height * 0.06,
                    width: width * 0.6,
                    color: AppColors.primary,
                    text: AppTexts.getStarted)
              ],
            )
          ],
        ),
      )),
    );
  }
}
