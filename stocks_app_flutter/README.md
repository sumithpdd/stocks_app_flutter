# stocks_app_flutter

A new Flutter project. 

## Create a Stock App

Data is loaded from
[https://my-json-server.typicode.com/sumithpdd/demo/stocks](https://my-json-server.typicode.com/sumithpdd/demo/stocks)

Open Command line and run

    > flutter create stocks_app_flutter
    > cd stocks_app_flutter

If you have VSCode installed with Flutter plugin.
[https://code.visualstudio.com/](https://code.visualstudio.com/)

    > code .

Cleanup the scaffold code
Create folder **models** inside **lib** folder and a file **stock.dart**

    class  Stock {
	    final  String symbol;
	    final  String description;
	    final  double price;
        final  String change;
     
        Stock({this.symbol, this.description, this.price, this.change});
	    factory  Stock.fromJson(Map<String, dynamic> json) {    
	    return  Stock(
	        symbol: json["symbol"],
	        description: json["description"],
	        price: json["price"].toDouble(),
	        change: json["change"],
	        );
        }
    }

Create folder **Services** inside **lib** folder

open pub and install **http** package 
[https://pub.dev/packages/http#-installing-tab-](https://pub.dev/packages/http#-installing-tab-)

Create a new file inside **services** -**web_service.dart**

Then create a viewmodel in the models folder '**StockListViewModel.dart**'
this will have code fro `fetchStocks` and `search` the view model implements `ChangeNotifierProvider ` that is part of **provider** package. So
update `pubspec.yaml` to add the provider package.
[https://pub.dev/packages/provider#-installing-tab-](https://pub.dev/packages/provider#-installing-tab-)

Update `main.dart` file

Split the stock list code in a widget folder create a file **stock_list.dart**

