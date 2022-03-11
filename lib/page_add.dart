import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pj/main.dart';
import 'data/item.dart';

class AddPage extends StatefulWidget {
  const AddPage(
      {Key? key, required this.title, required this.sub, required this.id})
      : super(key: key);

  final int id;
  final String title;
  final String sub;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _database = DBHelper();
  var _list;
  var _itemCnt = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => MyHomePage());
            },
            icon: Icon(Icons.save_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.drive_folder_upload_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: _itemCnt,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index < _itemCnt - 1) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          } else {
            return Center(
              child: IconButton(
                onPressed: () {
                  addItem();
                },
                icon: const Icon(
                  Icons.add_outlined,
                  color: Colors.blue,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    updateLocalItemList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateLocalItemList() {
    _database.initDB().then((value) => {
          _database.items(widget.id).then((value) {
            setState(() {
              _list = value;
              _itemCnt = value.length + 1;
            });
          })
        });
  }

  void addItem() {
    _database.insertItem(widget.id, 'test', 'imgLink').then((value) {
      setState(() {
        _itemCnt = value!;
      });
    });
  }
}
