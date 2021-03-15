/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that can be tapped. When
// tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
// entire card.

import 'package:flutter/material.dart';
import 'package:mqqt_test/main.dart';
import 'package:mqqt_test/mqtt%20/model%20/mqtt_model.dart';
import 'package:mqqt_test/mqtt%20/mqtt_connect.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:async';

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'IOIT METER READING';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
            color: Colors.black,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('IOIT METER'),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                ListTile(
                  tileColor: Colors.black26,
                  title: Text(
                    'Reconect',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    manager.connect();
                  },
                ),
                ListTile(
                  tileColor: Colors.black26,
                  title: Text(
                    'Disconnect',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    manager.onDisconnected();
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.black,
        ),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  //var listmeter = ioitMeterModel.data;
  @override
  Widget build(BuildContext context) {
    //print(ioitMeterModel.clientId);
    Timer everySecond;
    everySecond = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() => ioitMeterModel);
    });

    //var seconddata = ioitMeterModel.voltages;

    // print("Flutter");
    return ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'R Phase to Neutral Voltage',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 500,
                              axisLabelStyle: GaugeTextStyle(
                                  color: const Color(0xFFFFFFFF)),
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 500,
                                    color: Colors.white,
                                    startWidth: 10,
                                    endWidth: 10),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    animationDuration: 5000,
                                    value: ioitMeterModel.data[0] ?? 0,
                                    needleColor: Colors.red,
                                    needleLength: 0.6,
                                    knobStyle: KnobStyle(
                                        knobRadius: 0.10,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.red)),
                                RangePointer(
                                    value: ioitMeterModel.data[0] ?? 0,
                                    width: 10,
                                    enableAnimation: true,
                                    color: Colors.red)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    axisValue: 10,
                                    verticalAlignment: GaugeAlignment.center,
                                    horizontalAlignment: GaugeAlignment.center,
                                    widget: Container(
                                      child: Text(
                                          '${ioitMeterModel.data[0].toStringAsFixed(2) ?? 0} V',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'Y Phase to Neutral Voltage',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 500,
                              axisLabelStyle: GaugeTextStyle(
                                  color: const Color(0xFFFFFFFF)),
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 500,
                                    color: Colors.white,
                                    startWidth: 10,
                                    endWidth: 10),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    animationDuration: 5000,
                                    value: ioitMeterModel.data[1] ?? 0,
                                    needleColor: Colors.yellow,
                                    needleLength: 0.6,
                                    knobStyle: KnobStyle(
                                        knobRadius: 0.10,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.yellow)),
                                RangePointer(
                                    value: ioitMeterModel.data[1] ?? 0,
                                    width: 10,
                                    enableAnimation: true,
                                    color: Colors.yellow)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    axisValue: 10,
                                    verticalAlignment: GaugeAlignment.center,
                                    horizontalAlignment: GaugeAlignment.center,
                                    widget: Container(
                                      child: Text(
                                          '${ioitMeterModel.data[1].toStringAsFixed(2) ?? 0} V',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'B Phase to Neutral Voltage',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 500,
                              axisLabelStyle: GaugeTextStyle(
                                  color: const Color(0xFFFFFFFF)),
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 500,
                                    color: Colors.white,
                                    startWidth: 10,
                                    endWidth: 10),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    animationDuration: 5000,
                                    value: ioitMeterModel.data[2] ?? 0,
                                    needleColor: Colors.blue,
                                    needleLength: 0.6,
                                    knobStyle: KnobStyle(
                                        knobRadius: 0.10,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.blue)),
                                RangePointer(
                                    value: ioitMeterModel.data[2] ?? 0,
                                    width: 10,
                                    enableAnimation: true,
                                    color: Colors.blue)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    axisValue: 10,
                                    verticalAlignment: GaugeAlignment.center,
                                    horizontalAlignment: GaugeAlignment.center,
                                    widget: Container(
                                      child: Text(
                                          '${ioitMeterModel.data[2].toStringAsFixed(2) ?? 0} V',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'Average Voltage',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 500,
                              axisLabelStyle: GaugeTextStyle(
                                  color: const Color(0xFFFFFFFF)),
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 500,
                                    color: Colors.white,
                                    startWidth: 10,
                                    endWidth: 10),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    animationDuration: 5000,
                                    value: ioitMeterModel.data[3] ?? 0,
                                    needleColor: Colors.green,
                                    needleLength: 0.6,
                                    knobStyle: KnobStyle(
                                        knobRadius: 0.10,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.green)),
                                RangePointer(
                                    value: ioitMeterModel.data[3] ?? 0,
                                    width: 10,
                                    enableAnimation: true,
                                    color: Colors.green)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    axisValue: 10,
                                    verticalAlignment: GaugeAlignment.center,
                                    horizontalAlignment: GaugeAlignment.center,
                                    widget: Container(
                                      child: Text(
                                          '${ioitMeterModel.data[3].toStringAsFixed(2) ?? 0} V',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'RY Voltage',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 500,
                              axisLabelStyle: GaugeTextStyle(
                                  color: const Color(0xFFFFFFFF)),
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 500,
                                    color: Colors.yellow,
                                    startWidth: 10,
                                    endWidth: 10),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    animationDuration: 5000,
                                    value: ioitMeterModel.data[3] ?? 0,
                                    needleColor: Colors.red,
                                    needleLength: 0.6,
                                    knobStyle: KnobStyle(
                                        knobRadius: 0.10,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.yellow)),
                                RangePointer(
                                    value: ioitMeterModel.data[3] ?? 0,
                                    width: 10,
                                    enableAnimation: true,
                                    color: Colors.red)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    axisValue: 10,
                                    verticalAlignment: GaugeAlignment.center,
                                    horizontalAlignment: GaugeAlignment.center,
                                    widget: Container(
                                      child: Text(
                                          '${ioitMeterModel.data[3].toStringAsFixed(2) ?? 0} V',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'YB Voltage',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 500,
                              axisLabelStyle: GaugeTextStyle(
                                  color: const Color(0xFFFFFFFF)),
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 500,
                                    color: Colors.blue,
                                    startWidth: 10,
                                    endWidth: 10),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    animationDuration: 5000,
                                    value: ioitMeterModel.data[4] ?? 0,
                                    needleColor: Colors.yellow,
                                    needleLength: 0.6,
                                    knobStyle: KnobStyle(
                                        knobRadius: 0.10,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.blue)),
                                RangePointer(
                                    value: ioitMeterModel.data[4] ?? 0,
                                    width: 10,
                                    enableAnimation: true,
                                    color: Colors.yellow)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    axisValue: 10,
                                    verticalAlignment: GaugeAlignment.center,
                                    horizontalAlignment: GaugeAlignment.center,
                                    widget: Container(
                                      child: Text(
                                          '${ioitMeterModel.data[4].toStringAsFixed(2) ?? 0} V',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]),
                  ),
                ],
              ),
              Center(
                child: Card(
                  color: Colors.white,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Container(
                      width: 1080,
                      height: 500,
                      child: Column(
                        children: [
                          Text(
                            'R Phase to Neutral Voltage',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                          ),
                          Text('${ioitMeterModel.data[0] ?? 0} Volt'),
                          Text(
                            'Y Phase to Neutral Voltage',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[1] ?? 0} Volt'),
                          Text(
                            'B Phase to Neutral Voltage',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[2] ?? 0} Volt'),
                          Text(
                            'Average Voltage',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[3] ?? 0} Volt'),
                          Text(
                            'RY Voltage',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[4] ?? 0} Volt'),
                          Text(
                            'YB Voltage',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[5] ?? 0} Volt'),
                          Text(
                            'BR Voltage',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[6] ?? 0} Volt'),
                          Text(
                            'R Phase Line current',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[7] ?? 0} Ampere'),
                          Text(
                            'Y Phase Line current ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[8] ?? 0} Ampere'),
                          Text(
                            'B Phase Line current',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[9] ?? 0} Ampere'),
                          Text(
                            'Neutral Line current',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('${ioitMeterModel.data[10] ?? 0} Ampere'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}
