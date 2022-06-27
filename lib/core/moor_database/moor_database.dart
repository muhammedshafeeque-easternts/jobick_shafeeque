import 'dart:io';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
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
  BoolColumn get columnIsTitle => boolean()();
  // IntColumn get columnIsTitle => integer()();
  // BoolColumn get completed => boolean().withDefault(const Constant(false))();
}




@DriftDatabase(tables: [Jobs])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  Future<List<Job>> getAllJobs()async => await select(jobs).get();
  // Stream<List<Job>> watchAllJobs() => select(jobs).watch();

  Future<int> insertTask(JobsCompanion job) async {
    return await into(jobs).insert(job);
  }

  Future<int> deleteTask(Job job) async {
    return await delete(jobs).delete(job);
  }

  Future<bool> updateTask(Job job) async {
    return await update(jobs).replace(job);
  }

/*  Future insertTask(Insertable<Job> job) => into(jobs).insert(job);
  Future updateTask(Insertable<Job> job) => update(jobs).replace(job);
  Future deleteTask(Insertable<Job> job) => delete(jobs).delete(job);*/

  @override
  int get schemaVersion => 1;
}
/*  @override
  int get schemaVersion => 1;

  Future<List<Job>> getAllJobs() => select(jobs).get();
  Stream<List<Job>> watchAllJobs() => select(jobs).watch();
  Future insertTask(Insertable<Job> job) => into(jobs).insert(job);
  Future updateTask(Insertable<Job> job) => update(jobs).replace(job);
  Future deleteTask(Insertable<Job> job) => delete(jobs).delete(job);*/




LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
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


