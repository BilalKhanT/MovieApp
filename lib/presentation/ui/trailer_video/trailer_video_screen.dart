import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/ui/trailer_video/trailer_vid_args.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../domain/entities/trailer_entity.dart';

class TrailerVideoScreen extends StatefulWidget {
  final TrailerVideoArgs trailerVideoArgs;

  TrailerVideoScreen({Key? key, required this.trailerVideoArgs})
      : super(key: key);

  @override
  _TrailerVideoScreenState createState() => _TrailerVideoScreenState();
}

class _TrailerVideoScreenState extends State<TrailerVideoScreen> {

  late List<TrailerEntity> trailers;
  late YoutubePlayerController controller;

  void _onVideoEnded() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    trailers = widget.trailerVideoArgs.trailers;
    controller = YoutubePlayerController(
      initialVideoId: trailers[0].key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    controller.addListener(() {
      if (controller.value.playerState == PlayerState.ended) {
        _onVideoEnded();
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    controller.removeListener(() { });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff281537),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
        title: Text('Watch Trailer',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, state) {
          return Column(
            children: <Widget>[
              SizedBox(height: screenHeight * 0.15,),
              state,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      for (int i = 0; i < trailers.length; i++)
                        Container(
                          height: screenHeight * 0.15,
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  controller.load(trailers[i].key);
                                  controller.play();
                                },
                                child: CachedNetworkImage(
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: trailers[i].key,
                                    quality: ThumbnailQuality.high,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(trailers[i].title,
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}
