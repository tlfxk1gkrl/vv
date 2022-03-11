import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pj/components/listview_item_detail.dart';
import 'package:test_pj/page_add.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.title, required this.id, required this.sub}) : super(key: key);

  final int id;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: OutlinedButton(
          onPressed: () {
            Get.to(() => AddPage(id: id,title: title, sub: sub));
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                        'https://images.unsplash.com/photo-1644866679372-11af353e9b0a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY0NTU5ODM1NQ&ixlib=rb-1.2.1&q=80&w=1080'),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.lightBlueAccent,
                  thickness: 2,
                ),
                Expanded(
                  flex: 8,
                  child: Text(title),
                ),
              ],
            ),
          ),
        ));
  }
}
