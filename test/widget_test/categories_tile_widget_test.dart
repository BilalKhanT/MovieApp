import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/presentation/widgets/categories_tile.dart';

void main() {
  testWidgets('CategoriesTile displays genres with correct styling and layout', (WidgetTester tester) async {
    Genres genre1 = Genres(id: 1, name: 'Action');
    Genres genre2 = Genres(id: 2, name: 'Comedy');
    GenreEntity genreEntity = GenreEntity(genres: [genre1, genre2]);

    Widget testWidget = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return categoriesTile(context, [genreEntity]);
          },
        ),
      ),
    );


    await tester.pumpWidget(testWidget);

    expect(find.text('Action'), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Flexible), findsNWidgets(2));
    expect(find.byType(ListView), findsNWidgets(2));
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Padding), findsWidgets);

  });
}