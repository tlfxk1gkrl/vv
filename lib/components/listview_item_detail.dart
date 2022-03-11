import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  var _selected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.star_outline),
                ],
              ),
              const Text('Title', style: TextStyle(fontSize: 30),),
              const Text('2/16강', style: TextStyle(fontSize: 20, color: Colors.blue),),
              Row(
                children: [
                  Expanded(
                    flex: _selected == 'right' ? 3 : 1,
                    child: IconButton(
                      icon: Image.network(
                        'https://images.unsplash.com/photo-1644866679372-11af353e9b0a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY0NTU5ODM1NQ&ixlib=rb-1.2.1&q=80&w=1080',
                      ),
                      iconSize: 300,
                      onPressed: () {
                        setState(() {
                          _selected = 'right';
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  Expanded(
                    flex: _selected == 'left' ? 3 : 1,
                    child: IconButton(
                      icon: Image.network(
                        'https://images.unsplash.com/photo-1645256076810-84c7283c04b8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY0NjA0NjgwOA&ixlib=rb-1.2.1&q=80&w=1080',
                        fit: BoxFit.fill,
                      ),
                      iconSize: 300,
                      onPressed: () {
                        setState(() {
                          _selected = 'left';
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('>'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
