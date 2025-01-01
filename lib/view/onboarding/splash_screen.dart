import 'package:CareDash/core/utils/text_styles.dart';
import 'package:CareDash/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

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
                  width: width * 0.8,
                  child: PlayAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    delay: const Duration(milliseconds: 500),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.scale(
                          scale: value,
                          child: const Text(
                            'CareDash',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PlayAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    delay: const Duration(milliseconds: 800),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Text(
                          AppTexts.welcome,
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.5,
                            height: 1.5,
                            color: dark ? AppColors.lightgrey : AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  PlayAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    delay: const Duration(seconds: 1),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Column(
                          children: [
                            Text(
                              AppTexts.onBoardingTitle1,
                              style: AppTextStyles.headline4,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              AppTexts.onBoardingSubTitle1,
                              style: AppTextStyles.subtitle2,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: height * 0.049),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    delay: const Duration(seconds: 1),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: CustomButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContinueScreen(),
                              ),
                            );
                          },
                          height: height * 0.06,
                          width: width * 0.6,
                          color: AppColors.primary,
                          text: AppTexts.getStarted,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
