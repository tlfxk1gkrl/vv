import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_pj/data/vote.dart';
import 'package:test_pj/page_add.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTitlePage extends StatefulWidget {
  const AddTitlePage({Key? key}) : super(key: key);

  @override
  State<AddTitlePage> createState() => _AddTitlePageState();
}

class _AddTitlePageState extends State<AddTitlePage> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _subController = new TextEditingController();

  Widget _textFieldWidget(String type) {
    return TextField(
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: type == 'title' ? '제목' : '설명',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(8), // Added this
      ),
      maxLines: 10,
      minLines: 1,
      controller: type == 'title' ? _titleController : _subController,
      style: const TextStyle(color: Colors.blue, fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textFieldWidget('title'),
                const SizedBox(
                  height: 10,
                ),
                _textFieldWidget('sub'),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    addVote();
                  },
                  child: const Text('다음'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addVote() async {
    DBHelper dbHelper = DBHelper();
    await dbHelper
        .initDB()
        .then((value) => dbHelper
                .insertVote(_titleController.text, _subController.text)
                .then((value) {
              Get.offAll(() => AddPage(
                    id: value,
                    title: _titleController.text,
                    sub: _subController.text,
                  ));
            }).catchError((e) {}))
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
