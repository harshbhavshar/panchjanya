// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../internate_cubit.dart';
//
// class SecondScreen extends StatefulWidget {
//
//   const SecondScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SecondScreen> createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//   AudioPlayer audioPlugin = AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//
//   String formateTime(Duration duration){
//     String twoDigits(int n)=>n.toString().padLeft(2,'0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//
//     return [
//       if(duration.inHours > 0) hours,
//       minutes,
//       seconds,
//     ].join(':');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Track Details"),
//         centerTitle: true,
//         elevation: 0.0,
//         foregroundColor: Colors.white,
//         surfaceTintColor: Color(0xff574396),
//         backgroundColor: Color(0xff574396),
//       ),
//       body: BlocConsumer<InternetCubit, InternateState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           if (state == InternateState.Gain) {
//             return Column(
//               children: [
//                 Image.asset('assets/mataki.png',width: 220,),
//                 Slider(
//                   min: 0,
//                     max: duration.inSeconds.toDouble(),
//                     value: position.inSeconds.toDouble(),
//                     onChanged: (value)async{}
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text(formateTime(position)),
//                     Text(formateTime(duration - position)),
//                   ],
//                 ),
//                 IconButton(onPressed: ()async{
//                   if(isPlaying){
//                     await audioPlugin.pause();
//                   }
//                   else{
//                     String url = 'assets/kaarti.mp3';
//                     await audioPlugin.play(source)
//                   }
//                 }, icon: Icon(Icons.play_arrow))
//               ],
//             );
//           }
//            else if(state == InternateState.Lost) {
//             return Center(
//               child: Text('Check Your Connection'),
//             );
//           }
//            else{
//              return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:aartiya/screens/play.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState(){
    super.initState();
    player.init();
  }
  @override
  void dispose(){
    player.dispose();
  }
  final player = SoundPlayer();
  buildpaly(){
    final isPlaying = player.isPlaying;
    final icon = isPlaying?Icons.stop:Icons.play_arrow;
    return FloatingActionButton(onPressed: ()async{
      await player.togglePlaying(whenFinished: ()=>setState((){},));
      setState((){});
    },child: Icon(icon,color: Color(0xff00AF80),),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/bg.jpg',width: 200,),
            ),
          ),
          Text('aarti'),
          Text("Shree Krishna aarti"),
          Text("aarti kunj bihari ki ..."),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.fast_rewind),
              buildpaly(),
              Icon(Icons.fast_forward),
            ],
          ),
        ],
      ),
    );
  }
}

