import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData.dark(), home: Home()));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _dropDownValue = "Select here";
  int val = -1;
  int val2 = 2;
  bool _value = false;

  final myController = TextEditingController();
  var _currency = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
        ),
        backgroundColor: Color(0xFFFF1744),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Rupees',
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        _currency = double.parse(myController.text);
                      }),
                    },
                    child: Text("Convert"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 112, 6),

                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                  ),
                ),
              ),
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Entered Rupees',
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 236, 228, 228),
                height: 20,
                thickness: 0.1,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "US Dollars :\$" +
                            (_currency * 0.013).toStringAsFixed(3),
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 0.1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    GetConvertedCurrencyWidget(
                      currname: "Francs",
                      currval: 0.012,
                      inr: _currency,
                    ),
                    GetConvertedCurrencyWidget(
                      currname: "Jaanese",
                      currval: 1.53,
                      inr: _currency,
                    ),
                    GetConvertedCurrencyWidget(
                      currname: "Euro",
                      currval: 0.012,
                      inr: _currency,
                    ),
                    GetConvertedCurrencyWidget(
                      currname: "United Arab Emirates Dirham",
                      currval: 0.049,
                      inr: _currency,
                    ),
                    GetConvertedCurrencyWidget(
                      currname: "Saudi riyal",
                      currval: 0.045,
                      inr: _currency,
                    ),
                    DropdownButton(
                      hint: _dropDownValue == null
                          ? Text('Dropdown')
                          : Text(
                              _dropDownValue,
                              style: TextStyle(color: Colors.blue),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: ['One', 'Two', 'Three'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            _dropDownValue = val.toString();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Image.asset(
                '/insta.png',
                width: 40,
                height: 50,
              )
            ],
          ),
        )),
      ),
    );
  }
}

class GetConvertedCurrencyWidget extends StatefulWidget {
  double currval;
  String currname;
  double inr;
  GetConvertedCurrencyWidget(
      {Key? key,
      required this.currval,
      required this.currname,
      required this.inr})
      : super(key: key);

  @override
  State<GetConvertedCurrencyWidget> createState() =>
      _GetConvertedCurrencyWidgetState();
}

class _GetConvertedCurrencyWidgetState
    extends State<GetConvertedCurrencyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.currname +
                " : " +
                (widget.inr * widget.currval).toStringAsFixed(3),
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 228, 220, 220),
          height: 20,
          thickness: 0.1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
