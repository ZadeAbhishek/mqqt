import 'package:mqqt_test/mqtt%20/model%20/mqtt_model.dart';

var value = new Meterdata();

class StoreValue {
  void valuepass(val) {
    value = val;
  }

  Meterdata valuereturn() {
    return value;
  }
}
/*floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => ioitMeterModel.totalReactivePower),
        child: Icon(Icons.add),
      ),

      Mqqtmanager manager = new Mqqtmanager();
    manager.connect();
    print(ioitMeterModel.totalImportEnergy);
    print("Flutter"); */
/* Text(
                        'R Phase to Neutral Voltage',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                      Text('${ioitMeterModel.data[0]} Volt'),
                      Text(
                        'Y Phase to Neutral Voltage',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[1]} Volt'),
                      Text(
                        'B Phase to Neutral Voltage',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[2]} Volt'),
                      Text(
                        'Average Voltage',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[3]} Volt'),
                      Text(
                        'RY Voltage',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[4]} Volt'),
                      Text(
                        'YB Voltage',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[5]} Volt'),
                      Text(
                        'BR Voltage',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[6]} Volt'),
                      Text(
                        'R Phase Line current',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[7]} Ampere'),
                      Text(
                        'Y Phase Line current ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[8]} Ampere'),
                      Text(
                        'B Phase Line current',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[9]} Ampere'),
                      Text(
                        'Neutral Line current',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${ioitMeterModel.data[10]} Ampere'),
                      */
