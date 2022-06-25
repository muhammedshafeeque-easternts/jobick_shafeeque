import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Jobs extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get columnId => integer().autoIncrement()();
  TextColumn get columnPosition =>
      text()();
  TextColumn get columnType =>
      text()();
  TextColumn get columnPostedDate =>
      text()();
  TextColumn get columnLastDateToApply => text()();
  TextColumn get columnCloseDate => text()();
  TextColumn get columnStatus => text()();
  TextColumn get columnActions => text()();
  BoolColumn get columnIsTitle => boolean().withDefault(const Constant(false))();
  // IntColumn get columnIsTitle => integer()();
  // BoolColumn get completed => boolean().withDefault(const Constant(false))();
}




@UseMoor(tables: [Jobs])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Job>> getAllJobs() => select(jobs).get();
  Stream<List<Job>> watchAllJobs() => select(jobs).watch();
  Future insertTask(Insertable<Job> job) => into(jobs).insert(job);
  Future updateTask(Insertable<Job> job) => update(jobs).replace(job);
  Future deleteTask(Insertable<Job> job) => delete(jobs).delete(job);

/*

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {
            await migrator.addColumn(jobsd, jobsd.tagName);
            await migrator.createTable(tags);
          }
        },
        beforeOpen: (db, details) async {
          await db.customStatement('PRAGMA foreign_keys = ON');
        },
      );*/
}

/*@UseDao(
  tables: [Jobsd],
)
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

  Stream<List<TaskWithTag>> watchAllTasks() {
    return (select(tasks)
          ..orderBy(
            [
              (t) =>
                  OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.name),
            ],
          ))
        .join(
          [
            leftOuterJoin(tags, tags.name.equalsExp(tasks.tagName)),
          ],
        )
        .watch()
        .map((rows) => rows.map(
              (row) {
                return TaskWithTag(
                  task: row.readTable(tasks),
                  tag: row.readTable(tags),
                );
              },
            ).toList());
  }

  Future insertTask(Insertable<Jobsd> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Jobsd> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Jobsd> task) => delete(tasks).delete(task);
}*/


