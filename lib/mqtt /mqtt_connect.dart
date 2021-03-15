import 'dart:async';
//import 'dart:html';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:mqqt_test/mqtt%20/model%20/mqtt_model.dart';
import 'package:mqqt_test/mqtt%20/model%20/value_store.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:convert';

var ioitMeterModel = new Meterdata();
var status = 0;

class Mqqtmanager {
  StoreValue store = new StoreValue();
  MqttServerClient client =
      MqttServerClient.withPort('195.201.42.47', 'flutter_client', 1883);
  Future<bool> connect() async {
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.onDisconnected = onDisconnected;

    //client.onUnsubscribed = onUnsubscribed;

    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    /*final connMessage = MqttConnectMessage()
      .authenticateAs('username', 'password')
      .keepAliveFor(60)
      .withWillTopic('willtopic')
      .withWillMessage('Will message')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMessage;*/
    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
      return false;
    }
    return true;
  }

// connection succeeded
  void onConnected() {
    //print('SUBSCIRPBITNG');
    client.subscribe('IOITMeter', MqttQos.atLeastOnce);
    status = 1;

    //List<MqttReceivedMessage<MqttMessage>> mqqtlist = [];
  }

// unconnected
  void onDisconnected() {
    print('Disconnected');
    client.disconnect();
    status = 0;
  }

// subscribe to topic succeeded
  void onSubscribed(String topic) {
    //print('Connected to IP');
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      // print('Received message:$payload from topic: ${c[0].topic}>');
      // print(
//"----------------------------------${c[0]}--------------------------------");
      var map = json.decode(payload);
      ioitMeterModel.clientId = "";
      ioitMeterModel.d = "";

      ioitMeterModel = Meterdata.fromJson(map);
      store.valuepass(ioitMeterModel);
      //print(status);
      status = 1;
      //print(ioitMeterModel.totalReactivePower);
      //print(ioitMeterModel.monitorStatus)
      //print(ioitMeterModel.data);

      //print(map);

      //client.disconnect();
    });
  }

// subscribe to topic failed
  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

// unsubscribe succeeded
  void onUnsubscribed(String topic) {
    print('Unsubscribed topic: $topic');
  }

// PING response received
  void pong() {
    print('Ping response client callback invoked');
  }
}

bool checkconnection() {
  do {
    print("Status: $status");
  } while (status == 0);
  return true;
}
