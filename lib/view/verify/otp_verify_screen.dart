import 'package:CareDash/core/constants/colors.dart';
import 'package:CareDash/core/constants/strings.dart';
import 'package:CareDash/core/utils/text_styles.dart';
import 'package:CareDash/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/helpers/helper.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isResendAllowed = true;
  int _resendCountdown = 30;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
    _startResendCountdown();
  }

  void _verifyOTP() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    if (otp.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Verified: $otp')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
      );
    }
  }

  void _startResendCountdown() {
    setState(() {
      _isResendAllowed = false;
      _resendCountdown = 30;
    });

    Future.delayed(const Duration(seconds: 1), _updateResendCountdown);
  }

  void _updateResendCountdown() {
    if (_resendCountdown > 0) {
      setState(() {
        _resendCountdown--;
      });

      Future.delayed(const Duration(seconds: 1), _updateResendCountdown);
    } else {
      setState(() {
        _isResendAllowed = true;
      });
    }
  }

  void _resendOTP() {
    if (_isResendAllowed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Resent')),
      );

      _startResendCountdown();
    }
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: dark ? AppColors.dark : AppColors.light,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: dark ? AppColors.dark : AppColors.light,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  AppTexts.verifyTitle,
                  style: AppTextStyles.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  AppTexts.verifysubTitle,
                  style: AppTextStyles.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 40,
                      height: height * 0.07,
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor:
                            dark ? AppColors.white : AppColors.darkGrey,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: CustomButton(
                  height: 50,
                  onTap: _verifyOTP,
                  width: 200,
                  color: AppColors.primary,
                  text: 'Verify OTP',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: _isResendAllowed
                    ? GestureDetector(
                        onTap: _resendOTP,
                        child: const Text(
                          AppTexts.resendcode,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Text(
                        'Resend OTP in $_resendCountdown seconds',
                        style: TextStyle(
                          color: dark ? AppColors.white : AppColors.darkGrey,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
