import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../components/transition_dot.dart';
import '../components/pacman_slider.dart';
import '../constants/app_image_paths.dart';
import '../routes/routes.dart';
import '../utils/widget_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _submitAnimationController;
  static const int duration = 5;

  @override
  initState() {
    super.initState();
    _submitAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: duration),
    );

    _submitAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, RouteGenerator.inputPage)
            .then((value) => _submitAnimationController.reset());
      }
    });
  }

  @override
  void dispose() {
    _submitAnimationController.dispose();
    super.dispose();
  }

  void onPacmanSubmit() {
    _submitAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.cetaceanBlue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImagePaths.appSplashLogo,
                width: 125,
              ),
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              const Text(
                "BMI CALCULATOR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              const CircularProgressIndicator(
                color: Color(0xffFF0C63),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Check Your BMI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenAwareSize(16.0, context),
                  right: screenAwareSize(16.0, context),
                  bottom: screenAwareSize(22.0, context),
                  top: screenAwareSize(14.0, context),
                ),
                child: PacmanSlider(
                  submitAnimationController: _submitAnimationController,
                  onSubmit: onPacmanSubmit,
                ),
              ),
            ],
          ),
        ),
        TransitionDot(animation: _submitAnimationController),
      ],
    );
  }
}
