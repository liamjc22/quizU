import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  final String title;
  final String name;
  
  TextStyle titleStyle = TextStyle(color: Colors.white, letterSpacing: 6.0, decoration: TextDecoration.none, fontSize: 60);
  TextStyle textStyle = TextStyle(color: Colors.white, letterSpacing: 4.0, decoration: TextDecoration.none, fontSize: 30);
  StartPage(this.title, this.name);

  void editQuiz(BuildContext context){
    //todo change page to settings page
  }

  Widget _getBody(BuildContext context) {
    return Container(
        // color: Colors.lightBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title, style: titleStyle),
              RaisedButton(
                child: Text("Start"),
                onPressed: () {},
              ),
              new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 8,
                      ),
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          // image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
                          image: new AssetImage("assets/headshot.jpeg")
                      )
                    )
              ),
              Text("Made By " + name, style: textStyle),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: ()=> editQuiz(context),
          )
        ],
      ),
      backgroundColor: Colors.lightBlue,
      body: _getBody(context)
    );
  }
}
