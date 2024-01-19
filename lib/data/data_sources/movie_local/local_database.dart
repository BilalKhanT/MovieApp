import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../../models/movie_local_model.dart';
import 'DAO/movie_dao.dart';
part 'local_database.g.dart';

@Database(version: 2, entities: [StarredMovieModel])
abstract class AppDatabase extends FloorDatabase {
  StarredMovieDao get starredMovieDao;
}

Future<AppDatabase> initializeDatabase() async {
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .build();
  return database;
}