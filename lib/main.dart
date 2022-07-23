import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do App",
      home: draft(),
    );
  }
}

class draft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShoppingList"),
      ),
      body: mainScreen(),
    );
  }
}

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  TextEditingController t1 = TextEditingController();
  List shoppingList = [];

  addProduct() {
    setState(() {
      shoppingList.add(t1.text);
      t1.clear();
    });
  }

  removeProduct() {
    setState(() {
      shoppingList.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Flexible(
          child:
              ListView.builder(itemCount: shoppingList.length,itemBuilder: (context, indexNum) => ListTile(title:Text("$indexNum) "+shoppingList[indexNum]),))),
      TextField(
        decoration: new InputDecoration.collapsed(hintText: "---TYPE HERE---"),
        controller: t1,
      ),
      RaisedButton(
        onPressed: addProduct,
        child: Text("Add"),
        color: Colors.green,
      ),
      RaisedButton(
        onPressed: removeProduct,
        child: Text("Remove"),
        color: Colors.red,
      ),
    ]));
  }
}
