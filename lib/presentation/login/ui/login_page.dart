import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mediasoft_academy_flutter/app/l10n/l10n.dart';
import 'package:mediasoft_academy_flutter/app/router/router.dart';
import 'package:mediasoft_academy_flutter/app/style/app_colors.dart';
import 'package:mediasoft_academy_flutter/app/style/app_text_styles.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 74,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Введите вашу почту',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: '',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 74,
            ),
            GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(const StartRoute());
              },
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColorsLight.buttonColor,
                ),
                child: Center(
                  child: Text(
                    l10n.login,
                    style: AppTextStyles.s16w400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(const StartRoute());
              },
              child: SizedBox(
                height: 50,
                child: Text(
                  'Пропустить',
                  style: AppTextStyles.s16w400.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
