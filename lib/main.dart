import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData.light(),
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  List<Map<String, String>> songs = [];
  int currentIndex = -1;
  double playbackPosition = 0.0;
  double songDuration = 240.0; // Example duration
  Color primaryColor = Colors.blue; // Default primary color

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/songs.txt');

    if (!await file.exists()) {
      final data = await rootBundle.loadString('assets/songs.txt');
      await file.writeAsString(data);
    }

    final contents = await file.readAsString();
    setState(() {
      songs = contents.split('\n').map((line) {
        final parts = line.split(',');
        return {
          'title': parts[0],
          'artist': parts[1],
          'duration': parts[2],
        };
      }).toList();
    });
  }

  void playSong(int index) async {
    setState(() {
      currentIndex = index;
      playbackPosition = 0.0; // Reset position when a new song is played
    });
    
    // Dummy image URL for demonstration; replace with actual album art path
    String albumArtPath = 'assets/album_art.jpg';
    await _updateThemeColor(albumArtPath);
  }

  Future<void> _updateThemeColor(String imagePath) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
    );

    setState(() {
      primaryColor = paletteGenerator.dominantColor?.color ?? Colors.blue;
    });
  }

  void skipPrevious() {
    if (currentIndex > 0) {
      playSong(currentIndex - 1);
    }
  }

  void skipNext() {
    if (currentIndex < songs.length - 1) {
      playSong(currentIndex + 1);
    }
  }

  void onSliderChanged(double value) {
    setState(() {
      playbackPosition = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        backgroundColor: primaryColor,
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: primaryColor.withOpacity(0.1), // Background color transition
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return ListTile(
                    title: Text(song['title']!),
                    subtitle: Text('${song['artist']} - ${song['duration']}'),
                    onTap: () => playSong(index),
                    selected: currentIndex == index,
                    selectedTileColor: Colors.blue[100],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Slider(
                    value: playbackPosition,
                    min: 0,
                    max: songDuration,
                    onChanged: onSliderChanged,
                    activeColor: primaryColor,
                    inactiveColor: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.skip_previous, size: 40),
                        onPressed: skipPrevious,
                      ),
                      IconButton(
                        icon: Icon(
                          currentIndex >= 0 ? Icons.pause : Icons.play_arrow,
                          size: 40,
                        ),
                        onPressed: () {
                          if (currentIndex >= 0) {
                            setState(() {
                              currentIndex = -1; // Reset to no song playing
                            });
                          } else {
                            playSong(0); // Play the first song if nothing is playing
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next, size: 40),
                        onPressed: skipNext,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}