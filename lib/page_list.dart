import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pj/components/listview_item.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}
// mainAxisAlignment: MainAxisAlignment.center //Center Column contents vertically,
// crossAxisAlignment: CrossAxisAlignment.center //Center Column contents horizontally,
// mainAxisAlignment: MainAxisAlignment.center //Center Row contents horizontally,
// crossAxisAlignment: CrossAxisAlignment.center //Center Row contents vertically,

class _ListPageState extends State<ListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '검색',
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(8), // Added this
                      ),
                      controller: _searchController,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.search_outlined),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Item(title: widget.title),
                  Item(title: widget.title),
                  Item(title: widget.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
