import 'package:flutter/material.dart';
import 'package:flutter_app/ui/ocpa-app/ocpa-app.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<OcpaAppState>();
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for(var f in appState.favorites)
           ListTile(
            leading: Icon(Icons.favorite),
            title: Text(f.asLowerCase),
          ),
      ]
    );
  }
}
