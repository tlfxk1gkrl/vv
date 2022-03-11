import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pj/page_add_title.dart';

import 'components/create_item.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key, required this.title, required this.list})
      : super(key: key);

  final String title;
  final List list;

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.list.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: widget.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < widget.list.length - 1) {
                            return Item(
                              title: widget.list[index].title,
                              id: widget.list[index].id,
                              sub: widget.list[index].sub,
                            );
                          }
                          return OutlinedButton(
                            onPressed: () {
                              Get.to(() => const AddTitlePage());
                            },
                            child: const Icon(Icons.add_outlined),
                          );
                        },
                      ),
                    )
                  :
              OutlinedButton(
                onPressed: () {
                  Get.to(() => const AddTitlePage());
                },
                child: const Icon(Icons.add_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
