import 'package:flutter/material.dart';
import 'package:sport_highlights_app/screens/highlights_screen.dart';
import '../models/match.dart';
import '../services/api_service.dart';

class MatchesScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: FutureBuilder<List<Match>>(
        future: apiService.fetchMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No matches found'));
          }

          final matches = snapshot.data!;
          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              return ListTile(
                title: Text('Match on ${match.date}'),
                subtitle: Text('Created at: ${match.createdAt}'),
                onTap: () {
                  // Naviga agli highlights di questo match
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HighlightsScreen(matchId: match.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
