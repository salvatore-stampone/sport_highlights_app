import 'package:flutter/material.dart';
import '../models/highlight.dart';
import '../services/api_service.dart';

class HighlightsScreen extends StatelessWidget {
  final int matchId;
  final ApiService apiService = ApiService();

  HighlightsScreen({required this.matchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highlights'),
      ),
      body: FutureBuilder<List<Highlight>>(
        future: apiService.fetchHighlightsByMatch(matchId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No highlights found'));
          }

          final highlights = snapshot.data!;
          return ListView.builder(
            itemCount: highlights.length,
            itemBuilder: (context, index) {
              final highlight = highlights[index];
              return ListTile(
                title: Text('Highlight at ${highlight.clickTimestamp}s'),
                subtitle: Text('Video: ${highlight.videoPath}'),
                onTap: () {
                  // Riproduzione del video
                },
              );
            },
          );
        },
      ),
    );
  }
}
