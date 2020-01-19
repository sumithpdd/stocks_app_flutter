import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/stock_list_viewmodel.dart';
import 'widgets/stock_list.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Stocks",
        home: ChangeNotifierProvider(
            create: (_) => StockListViewModel(), child: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  StockListViewModel _stockListViewModel;

  @override
  void initState() {
    super.initState();
    _stockListViewModel =
        Provider.of<StockListViewModel>(context, listen: false);
    _stockListViewModel.fetchStocks();
  }

  void _filterStocks(String searchTerm) {
    _stockListViewModel.search(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Stocks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  Text("${DateFormat('yyyy-MM-dd').format(DateTime.now())}",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                        height: 50,
                        child: TextField(
                          onChanged: (value) {
                            _filterStocks(value);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: "Search",
                              prefix: Icon(Icons.search),
                              fillColor: Colors.grey[800],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                        )),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height - 310,
                        child: StockList(stocks: _stockListViewModel.stocks)),
                  )
                ]),
          ))
    ]));
  }
}
