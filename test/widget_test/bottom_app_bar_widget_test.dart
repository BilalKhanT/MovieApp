import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/presentation/ui/home_screen/home_screen.dart';
import 'package:movie_app/presentation/ui/saved_screen/saved_movie_screen.dart';
import 'package:movie_app/presentation/widgets/bottom_app_bar.dart';

void main() {
  testWidgets('BottomAppBar displays navigation items correctly', (WidgetTester tester) async {
    Widget testWidget = MaterialApp(
      home: Scaffold(
        body: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return bottomAppBar(context, 0);
          },
        ),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Watch'), findsOneWidget);
    expect(find.text('Media Library'), findsOneWidget);
    expect(find.text('More'), findsOneWidget);
    expect(find.byIcon(Icons.dashboard_outlined), findsOneWidget);
    expect(find.byIcon(Icons.local_play_outlined), findsOneWidget);
    expect(find.byIcon(Icons.my_library_music_outlined), findsOneWidget);
    expect(find.byIcon(Icons.tune_outlined), findsOneWidget);

  });
}