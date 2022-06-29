import 'package:hive/hive.dart';
import 'package:jobick_shafeeque/core/models/table_model.dart';

class AppDatabase {
  static Future<Box<JobModel>> getJobsDb() async{
    return await Hive.openBox<JobModel>('jobs_db');

  }

  Future<List<JobModel>>getAllJobs()async{
    final db = await getJobsDb();
    return db.values.toList();
  }

  Future<void> addJob(JobModel job)async{
    final db = await getJobsDb();
   db.add(job);
  }

  Future<void> updateJob(JobModel job)async{
    final db = await getJobsDb();
    db.put(job.id, job);
  }

   Future<void> deleteJob(JobModel job)async{
    final db = await getJobsDb();
    db.delete(job.id);
  }

}
