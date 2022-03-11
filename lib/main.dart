import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_pj/components/appbar.dart';
import 'package:test_pj/controller/id_controller.dart';
import 'package:test_pj/controller/password_controller.dart';
import 'package:test_pj/data/vote.dart';
import 'package:test_pj/page_create.dart';
import 'package:test_pj/page_favorite.dart';
import 'package:test_pj/page_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(IdController());
    Get.put(PasswordController());
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'gangwonSW',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;
  final _database = DBHelper();
  var _list;

  final List _pageText = [
    const ListPage(
      title: 'List Page',
    ),
    const FavoritePage(
      title: 'Favorite Page',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_outlined),
            label: 'create',
          ),
        ],
      ),
      body: Center(
        child: _selectedIndex != 2
            ? _pageText.elementAt(_selectedIndex)
            : CreatePage(title: 'create page', list: _list),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    updateLocalList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateLocalList() {
    _database.initDB().then((value) => {
      _database.votes().then((value) {
        setState(() {
          _list = value;
        });
      })
    });
  }
}
