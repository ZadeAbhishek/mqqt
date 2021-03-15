// To parse this JSON data, do
//
//     final meterdata = meterdataFromJson(jsonString);

import 'dart:convert';

Meterdata meterdataFromJson(String str) => Meterdata.fromJson(json.decode(str));

String meterdataToJson(Meterdata data) => json.encode(data.toJson());

class Meterdata {
  Meterdata({
    this.clientId,
    this.modbusId,
    this.startReg,
    this.ts,
    this.d,
    this.data,
  });

  String clientId = "1";
  String modbusId = "1";
  String startReg = "1";
  String ts = "1";
  String d = "1";
  List<double> data;

  factory Meterdata.fromJson(Map<String, dynamic> json) => Meterdata(
        clientId: json["ClientID"],
        modbusId: json["ModbusID"],
        startReg: json["StartReg"],
        ts: json["TS"],
        d: json["D"],
        data: List<double>.from(json["data"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "ClientID": clientId ?? "",
        "ModbusID": modbusId ?? "",
        "StartReg": startReg ?? "",
        "TS": ts ?? "",
        "D": d ?? "",
        "data": List<dynamic>.from(data.map((x) => x)) ??
            [
              241.112839,
              238.048920,
              243.722885,
              240.961533,
              416.036255,
              417.505066,
              418.520630,
              22.785801,
              30.461800,
              13.704600,
              17.645201,
              22.611300,
              29.391100,
              13.158200,
              2.814700,
              8.005600,
              3.831300,
              0.992000,
              0.964000,
              0.960000,
              0.975000,
              5.452800,
              6.979500,
              3.161500,
              15.593900,
              0.678600,
              1.905700,
              0.933700,
              3.518100,
              5.493900,
              7.251400,
              3.340100,
              16.045799,
              239.697861,
              239.670395,
              240.642700,
              50.051998,
              0.219628,
              38.000000,
              3.110000,
              3.350000,
              3.930000,
              23.559999,
              34.560001,
              94.129997
            ],
      };
}
