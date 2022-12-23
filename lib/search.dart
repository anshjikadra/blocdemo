import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleads/product.dart';
import 'package:http/http.dart' as http;
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: search(),
  ));
}


class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {

  List list=[];
  List<product> productlist=[];
  List<product> tempproductlist=[];

  getdata()
  async {
    var url = Uri.https('dummyjson.com','products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    Map m=jsonDecode(response.body);
    // print('Response body: ${m['products']}');
    list=m['products'];
    list.forEach((element) {
      product p=product.fromJson(element);
      productlist.add(p);
    });
    tempproductlist=productlist;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

    List list=[11,33,556,34,6,73,889];
    list.sort((a, b) => a-b);
    print(list);
    list.sort((b, a) => a-b);
    print(list);

    // print(list.where((element) => element>40));
    // print(list.where((element) => element>40).toList());

  }
  int index=0;
  List<Widget> multipleimages(List images)
  {
    List<Widget> w=[];
    images.forEach((element) {
      w.add(Image.network(element));
    });
    return w;
  }
  bool search=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search?
      AppBar(
        title: TextField(
          onChanged: (value) {
           productlist=tempproductlist.where((element) =>
               element.title.toLowerCase().startsWith(value.toLowerCase())).toList();
            setState(() {});
          },
        ),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              search=!search;
            });
          }, icon: Icon(Icons.cancel))
        ],):
      AppBar(
        title: Text("Product list"),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              search=!search;
            });
          }, icon: Icon(Icons.search))
        ],)
        ,
      body: ListView.builder(
        itemCount: productlist.length,
        itemBuilder: (context, index) {
        return ExpansionTile(
          children:multipleimages(productlist[index].images),
          title: Text("${productlist[index].title}"),
          subtitle: Text("${productlist[index].price}"),
          leading: Image.network('${productlist[index].thumbnail}'),
        );
      },),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index=value;
            if(index==0)
              {
                productlist.sort((a, b) => a.title.compareTo(b.title));
              }
            if(index==1)
              {
                productlist.sort((b, a) => a.title.compareTo(b.title));
              }
            if(index==2)
              {
                productlist.sort((a, b) => a.price-b.price);
              }
            if(index==3)
              {
                productlist.sort((b, a) => a.price-b.price);
              }
          });
        },
        currentIndex: index,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "atoz"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "ztoa"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "ltoh"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "htol"),
        ],
      ),
    );
  }
}
