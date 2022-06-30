import 'package:hive/hive.dart';
import 'package:jobick_shafeeque/core/models/table_model.dart';

class AppDatabase {
  static Box<JobModel> getJobsDb() {
    return  Hive.box<JobModel>('jobs_db');

  }

  Future<List<JobModel>>getAllJobs()async{
    final db =  getJobsDb();
    return db.values.toList();
  }

  Future<void> addJob(JobModel job)async{
    final db =  getJobsDb();
   db.add(job);
  }

  Future<void> updateJob(JobModel job)async{
    final db =  getJobsDb();
    final jobToUpdate =  db.values.firstWhere((element) {
      return element.id == job.id;
    });

    db.put(jobToUpdate.key, job);

    // job.save();
  }

   Future<void> deleteJob(JobModel job)async{
    final db =  getJobsDb();
    db.delete(job.key);
  }

}
