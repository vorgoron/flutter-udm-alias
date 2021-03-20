import 'package:flutter/material.dart';
import 'package:udm_alias_app/select_mode_screen.dart';
import 'package:package_info/package_info.dart';

import 'constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.info_outline),
                      iconSize: 46,
                      color: primaryColor,
                      onPressed: () async {
                        PackageInfo packageInfo = await PackageInfo.fromPlatform();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/logo.png",
                                    width: 45,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Ӧлиас'),
                                        Text('v${packageInfo.version}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Шудонлэн малпасез:',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    Text('- Chukinder\n'),
                                    Text('Кылдытӥсьёс:',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    Text('- Лукыш Гири'),
                                    Text('- Иван Шабалин'),
                                    Text('- Арсений Поздеев'),
                                    Text('- Алёна Мазитова\n'),
                                    Text('Суредасьёс:',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    Text('- Марина Степанова'),
                                    Text('- Ульяна Архипова\n'),
                                    Center(child: Text('Шундыкар 2021', style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Ворсано'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Text('ӦЛИАС', style: TextStyle(fontSize: 55)),
                  Text('тужгес но тунсыко шудон',
                      style: TextStyle(fontSize: 15, color: Colors.black26)),
                ],
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SelectModeScreen();
                        },
                      ));
                    },
                    color: Color.fromARGB(255, 234, 35, 102),
                    child: Text(
                      'Выль шудон'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 0)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
