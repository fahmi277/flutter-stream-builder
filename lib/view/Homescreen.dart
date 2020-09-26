import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:skripsi_sinyal_tv/service/apiService.dart';
// import 'package:expansion_card/expansion_card.dart';

String titleApplication = "Sinyal Monitoring";
var titles = ["POS 1", "POS 2", "POS 3", "POS 4"];
var dataTegangan = ["0", "0", "0", "0"];
var dataSinyal = ["0", "0", "0", "0"];
var dataArus = ["0", "0", "0", "0"];
var dataServer = ["0", "0", "0"];
var dataGangguan = [
  "Gangguan Terdeteksi",
  "Gangguan Terdeteksi",
  "Gangguan Terdeteksi",
  "Gangguan Terdeteksi"
];
var statushardware = ["Terputus", "Terputus", "Terputus", "Terputus"];

final icons = [Icons.home,Icons.warning,Icons.save];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920,
      width: 1080,
      allowFontScaling: false,
    );
    return ResponsiveWidgets.builder(
      height: 1920,
      width: 1080,
      allowFontScaling: false,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(titleApplication),
          ),
        ),
        body: Stack(
          children: <Widget>[
            myWidget(context, 1),
            Padding(
              padding: EdgeInsetsResponsive.only(top: 200),
              child: myWidget(context, 2),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              Colors.blue, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: Text(
                "Voltage Server",
                style: TextStyle(color: Colors.white),
              ),
              title: new Text(
                dataServer[0] + " V",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Current Server",
                style: TextStyle(color: Colors.white),
              ),
              title: new Text(
                dataServer[1] + " A",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Signal Server",
                style: TextStyle(color: Colors.white),
              ),
              title: new Text(
                dataServer[2] + " %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myWidget(BuildContext context, int selector) {
    // dataSinyal[0] = StreamBuilder(
    //   stream: Stream.periodic(Duration(seconds: 5))
    //       .asyncMap((i) => getHttp()), // i is null here (check periodic docs)
    //   builder: (context, snapshot) => Text(snapshot.data.toString()), // builder should also handle the case when data is not fetched yet
    // );


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blue,
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icons[selector-1],
                color: Colors.white,
              ),
              Text(
                titles[selector-1],
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          title: Row(
            children: <Widget>[
              StreamBuilder(
                  stream: Stream.periodic(Duration(seconds: 5)).asyncMap((i) =>
                      getHttp(selector,
                          "V2")), // i is null here (check periodic docs)
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Sinyal : " + snapshot.data.toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    } else {
                      return Text(
                        "Sinyal : ",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  } // builder should also handle the case when data is not fetched yet
                  ),
            ],
          ),
          trailing: Icon(icons[2]),
          subtitle: Row(
            children: <Widget>[
              StreamBuilder(
                  stream: Stream.periodic(Duration(seconds: 5)).asyncMap((i) =>
                      getHttp(selector,
                          "V0")), // i is null here (check periodic docs)
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Voltage : " + snapshot.data.toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    }
                   
                     else {
                      return Text(
                        "Voltage : ",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  } // builder should also handle the case when data is not fetched yet
                  ),
                  Text(" -- ",style: TextStyle(color: Colors.blue),),
                  StreamBuilder(
                  stream: Stream.periodic(Duration(seconds: 6)).asyncMap((i) =>
                      getHttp(selector,
                          "V1")), // i is null here (check periodic docs)
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Current : " + snapshot.data.toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    } else {
                      return Text(
                        "Current : ",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  } // builder should also handle the case when data is not fetched yet
                  ),
            ],
          ),
          // Text(
          //   dataMasuk[index],
          //   style: TextStyle(color: Colors.white),
          // ),
        ),
      ),
    );
  }
}
