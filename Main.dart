import 'package:flutter/material.dart';
import 'detail.dart';
import 'karakter.dart';
import 'about.dart';

void main(){
runApp(new MaterialApp(
  home: new Home(),
title: "navigasi",
routes: <String, WidgetBuilder>{
'/MyApp' : (BuildContext context) =>new MyApp(),
'/Home': (BuildContext context) =>new Home(),
'/MyProfil' : (BuildContext context) =>new MyProfil(),
},
));
}

class MyAppextends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
      title: 'BOLA BESAR',
debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: ListPage(),
);
}
}

class Home extends StatefulWidget {
@override
_HomeStatecreateState() =>new _HomeState();
}

class _HomeStateextends State<Home> {

var_nama= new TextEditingController();

@override
Widget build(BuildContext context) {
return new Scaffold(
appBar: new AppBar(
        leading: new Icon(Icons.view_list),
title: new Text('BOLA BESAR'),
centerTitle: true,
backgroundColor: Colors.blue,
actions: <Widget>[
new IconButton(
            icon: Icon(Icons.person_outline),
onPressed: (){
Navigator.pushNamed(context, '/MyProfil');
},
)
        ],
),

body: ListView(
        children: <Widget>[
new Container(
            child:
Image.asset('images/KUMPULAN.jpeg',
fit: BoxFit.fitWidth,),
),
          new Container(
            padding: new EdgeInsets.all(20.0),
child: new Column(
              children: <Widget>[
new TextField(
                  controller: _nama,
decoration: new InputDecoration(
hintText: "MASUKAN NAMA ANDA",
labelText: "NAMA",
border: new OutlineInputBorder(
borderRadius: new BorderRadius.circular(10.0)
                      )
                  ),
),

             new Container(
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
child: MaterialButton(
            color: Colors.blue,
child: Text ("PENJELASAN BOLA BESAR"),
onPressed: () {
Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>MyApp()
              )
              );
}
              ),
),
]
            )
          ),
],
),
bottomNavigationBar: BottomAppBar(
//color: Colors.transparent,
child: Container(
          height: 60,
color: Colors.black54,
alignment: Alignment.center,
child: Text(
'BOLA BESAR',
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.w500,
color: Colors.white),
),
),
//elevation: 0,
),
);
}
}

class ListPageextends StatefulWidget {
@override
_ListPageStatecreateState() =>_ListPageState();
}

class _ListPageStateextends State<ListPage> {
PageController_controller;

_goToDetail(Karakterkarakter) {
final page = Detail(karakter: karakter);
Navigator.of(context).push(
PageRouteBuilder<Null>(
pageBuilder: (BuildContext context, Animation<double> animation,
Animation<double>secondaryAnimation) {
return AnimatedBuilder(
                animation: animation,
builder: (BuildContext context, Widget child) {
return Opacity(
                    opacity: animation.value,
child: page,
);
});
},
transitionDuration: Duration(milliseconds: 400)),
);
}

_pageListener() {
setState(() {});
}

@override
void initState() {
_controller = PageController(viewportFraction: 0.6);
_controller.addListener(_pageListener);
super.initState();
}

@override
void dispose() {
_controller.removeListener(_pageListener);
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
        title: Text("BOLA BESAR"),
backgroundColor: Colors.lightBlue,
),
body: PageView.builder(
scrollDirection: Axis.vertical,
controller: _controller,
itemCount: karakters.length,
itemBuilder: (context, index) {
            double currentPage = 0;
            try {
currentPage = _controller.page;
} catch (_) {}

final resizeFactor =
            (1 - (((currentPage - index).abs() * 0.3).clamp(0.0, 1.0)));
            final karakterSekarang = karakters[index];
            return ListItem(
karakter: karakterSekarang,
resizeFactor: resizeFactor,
onTap: () => _goToDetail(karakterSekarang),
);
}),
);
}
}

class ListItemextends StatelessWidget {
final Karakterkarakter;
  final double resizeFactor;
  final VoidCallbackonTap;

constListItem({
    Key key,
@required this.karakter,
@required this.resizeFactor,
@required this.onTap,
}) : super(key: key);

@override
Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height* 0.4;
double width = MediaQuery.of(context).size.width* 0.85;
    return InkWell(
onTap: onTap,
child: Align(
        alignment: Alignment.topCenter,
child: Container(
            width: width * resizeFactor,
height: height * resizeFactor,
child: Stack(
              children: [
Positioned(
                  left: 0,
right: 0,
top: height / 4,
bottom: 0,
child: Hero(
                    tag: "background_${karakter.title}",
child: Card(
clipBehavior: Clip.antiAliasWithSaveLayer,
elevation: 10,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15)),
child: DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
Color(karakter.color),
Colors.white,
],
stops: [
0.4,
1.0,
])),
child: Container(
                          alignment: Alignment.bottomLeft,
margin: EdgeInsets.only(
                            left: 20,
bottom: 10,
),
child: Text(
karakter.title,
style: TextStyle(
fontSize: 24 * resizeFactor,
fontWeight: FontWeight.w600,
),
),
),
),
),
),
),
Align(
                  alignment: Alignment.topRight,
child: Hero(
                    tag: "image_${karakter.title}",
child: Image.asset(
karakter.avatar,
width: width / 2,
height: height,
),
),
),
],
)
        ),
),
);
}
}
 
