import 'dart:convert';
import 'dart:math';
import 'package:aartiya/model/datamodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BannerAd myBannerAD = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(onAdFailedToLoad: (ad, error) {
        print('Ad faild with error: $error');
        ad.dispose();
      }),
      request: AdRequest());

  Future<List<DataModel>> readJson() async {
    final  response =
        await rootBundle.loadString('assets/json/data.json');
    final list =  json.decode(response) as List<dynamic>;
    return list.map((e) => DataModel.fromJson(e)).toList();

  }


  @override
  void initState() {
    super.initState();
    // print("ppt");
    // print(readJson().toString());
    // print("ppt");
    myBannerAD.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("आरती"),
            backgroundColor: Colors.transparent,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Center(child: Text('||श्री||')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'नमस्कार\nदिन की शुरुआत\nआरती के संग',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                Container(
                  child: Image.asset(
                    "assets/mataki.png",
                    width: 120,
                  ),
                  transform: Matrix4.translationValues(0, -110, 0),
                )
              ],
            ),
            Text("gf",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
                Expanded(
                  child: FutureBuilder(
                    future: readJson(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData){
                      var items = snapshot.data as List;
                      return Expanded(
                        child: ListView.builder(itemBuilder: (context,index){
                          return  Card(
                            child: Text(items[index].name),
                          );
                        }),
                      );
                    }
                    else{
                      return Text("data koni");
                    }
                  },),
                )
          ])),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: myBannerAD.size.height.toDouble(),
      //   width: myBannerAD.size.width.toDouble(),
      //   child: AdWidget(
      //     ad: myBannerAD,
      //   ),
      // ),
    );
  }
}
