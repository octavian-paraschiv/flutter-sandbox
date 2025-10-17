import 'package:flutter/material.dart';
import 'package:flutter_app/ui/shared/hyper_link.widget.dart';
import 'package:flutter_app/data/services/protone_builds/protone_builds.service.dart';
import 'package:flutter_app/data/models/protone_builds/protone_builds.models.dart';

class ProtoneBuildsPage extends StatelessWidget {
  final Future<List<BuildInfo>> _future = loadBuilds();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BuildInfo>>(
      future: _future, 
      builder: (context, AsyncSnapshot<List<BuildInfo>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ); // Loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && (snapshot.data?.isNotEmpty ?? false)) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (snapshot.data ?? []).map((build) => 
                HyperLink(
                  Uri.parse(build.url ?? ''),
                  "${build.title} - built on ${build.buildDate}"))
                .toList(),
            ),
          );
        } else {
          return Text('No data');
        }
      }
    );     
  }

  static Future<List<BuildInfo>> loadBuilds() async {
    try {
      var legacyBuilds = await ProtoneBuildsService.getProtoneBuilds('legacy');
      var releaseBuilds = await ProtoneBuildsService.getProtoneBuilds('true');
      var otherBuilds = await ProtoneBuildsService.getProtoneBuilds('false');
      return (legacyBuilds ?? []) + (releaseBuilds ?? []) + (otherBuilds ?? []);
    } catch(err, xx) {
      print(err);
      print(xx);
      return [];
    }
  }
}