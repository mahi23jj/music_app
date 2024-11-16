import 'package:flutter/material.dart';
import 'package:music_app/model/playlist.dart';
import 'package:provider/provider.dart';

class detail extends StatefulWidget {

  detail(
      {super.key,
      });

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        final play=value.playlist;

       final currentsong=play[value.currentIndex ?? 0];

      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('Song Page'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 15,
                            offset: Offset(4, 4)),
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 15,
                            offset: Offset(-4, -4)),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(currentsong.AlbumArt),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentsong.SongName,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  currentsong.ArtistName,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Icon(Icons.favorite),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('0:00'),
                    Icon(Icons.shuffle),
                    Icon(Icons.repeat),
                    Text('0:00'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12)),
                  child: Slider(
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    min: 0,
                    max: value.position.inSeconds.toDouble(),
                    value: value.duration.inSeconds.toDouble(),
                    onChanged: (double double) {
                         value.seekToPosition(Duration(seconds: double.toInt()));
                    },
                    onChangeEnd: (double double) {
                      value.seekToPosition(Duration(seconds: double.toInt()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 15,
                                offset: Offset(4, 4)),
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 15,
                                offset: Offset(-4, -4)),
                          ]),
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: value.previousSong,
                        child: Icon(
                          Icons.skip_previous,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 15,
                                offset: Offset(4, 4)),
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 15,
                                offset: Offset(-4, -4)),
                          ]),
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap:value.togglePlayPause ,
                        child: Icon(
                          value.isPlaying ? Icons.pause : Icons.play_arrow,
                        
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 15,
                                offset: Offset(4, 4)),
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 15,
                                offset: Offset(-4, -4)),
                          ]),
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap:value.nextSong ,
                        child: Icon(
                          Icons.skip_next,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
          );
  }
    );
  }
}
