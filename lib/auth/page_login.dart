import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pj/controller/id_controller.dart';
import 'package:test_pj/controller/password_controller.dart';
import 'package:test_pj/main.dart';
import 'package:test_pj/page_account.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _idController = Get.find<IdController>();
  final TextEditingController _passwordController = Get.find<PasswordController>();

  Widget _textFieldWidget(String title){
    return TextField(
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: title,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(8), // Added this
      ),
      controller: title == '아이디'? _idController:_passwordController,
      obscureText: title == '아이디'? false : true,
      style: const TextStyle(color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            _textFieldWidget('아이디'),
            const SizedBox(height: 10,),
            _textFieldWidget('비밀번호'),
            const SizedBox(height: 10,),
            OutlinedButton(
              onPressed: () {
                Get.to(()=>const AccountPage(title: '',));
              },
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }

}
