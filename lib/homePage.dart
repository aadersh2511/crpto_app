
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  List currencies;
  HomePage(this.currencies);
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return HomePageState(currencies);
    }
}

class HomePageState extends State<HomePage>{
  List currencies; 
  List<Color> color=[Colors.blue,Colors.green,Colors.orange,Colors.black,Colors.deepPurple,Colors.lightGreen];
  HomePageState(this.currencies);
  
  @override
    Widget build(BuildContext context) {
      print(currencies);
      // TODO: implement build
      return Container(
        child: ListView.builder(
         itemBuilder: (context,index){
           Map company=currencies[index];
           Color c=color[index % color.length];
           return Item(company,c);
         },
         itemCount: currencies.length, 
        ),
        
      );
    }
}
class Item extends StatelessWidget{
  final Map company;
  final Color color;
  Item(this.company,this.color);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Card(
        margin: EdgeInsets.all(2.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                child: Text(company['symbol'],style: TextStyle(
                  color: Colors.white
                )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    title(company['name']),
                    price(company['price_usd']),
                    percentageChange(company['percent_change_24h'])

                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    Widget title(name){
      return Text(name,style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),);
    }
    Widget price(priceUsd){
      String p="price in \$ :$priceUsd";
      return Text(p);
    }
    Widget percentageChange(percentage){
      percentage=double.parse(percentage);
      Color color;
      if(percentage<0){
        color=Colors.red;
      }
      else if(percentage>0){
        color=Colors.green;
      }else{
        color=Colors.blue;
      }
      return Text("percentage change in 24hrs: $percentage%",style: TextStyle(
        color: color
      ),);
    }
}
