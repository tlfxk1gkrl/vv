import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pj/auth/page_login.dart';
import 'package:test_pj/controller/id_controller.dart';
import 'package:test_pj/controller/password_controller.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Get.find<IdController>().text != ''
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '아이디 : ${Get.find<IdController>().text}',
                    style: const TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '비밀번호 : ${Get.find<PasswordController>().text}',
                    style: const TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.find<IdController>().text = '';
                      setState(() {

                      });
                    },
                    child: const Text(
                      'LogOut',
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '로그인 후 이용해주세요.',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.to(
                        () => const LoginPage(),
                      );
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
