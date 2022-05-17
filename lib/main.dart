import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  bool _value1 = false;
  bool _value2 = false;

  int _value3=0;
  int _value4=0;

  void _value1Changed(bool? value) => setState(() => _value1 = value!);
  void _value2Changed(bool? value) => setState(() => _value2 = value!);

  void _setValue1(int? value) => setState(()=> _value3 = value!);
  void _setValue2(int? value) => setState(()=> _value4 = value!);
  
  Widget makeRadios () {
  
    List<Widget> list = <Widget> [];
    for (int i=0; i < 3; i ++){
      list.add(new Radio(value: i, groupValue: _value3, onChanged: _setValue1));
    }
    Column column= Column (children: list ,);
    return column;
  }

  Widget makeRadioTiles()
  {
    List<Widget> list =  <Widget>[];

    
    for(int i=0;i<3;i++)
    {
      list.add(new RadioListTile(
        value: i, 
        groupValue: _value4, 
        onChanged: _setValue2,
        activeColor: Colors.blue,
        controlAffinity: ListTileControlAffinity.trailing,
        title: new Text("Item : ${i}"),
        subtitle: new Text("Subtitle"),
        tileColor :Colors.greenAccent,
        
        )
      );
    }
    Column column =new Column(children: list,);
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Checkbox(
                  value: _value1, 
                  onChanged: _value1Changed,
                  ),
              new CheckboxListTile(
                  value: _value2,
                  onChanged: _value2Changed,
                  title: new Text('Hello World'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Subtitle'),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.blueAccent,
              ),
              makeRadios(),
              makeRadioTiles()
            ],
          ),
        )
      ),
    );
  }
}