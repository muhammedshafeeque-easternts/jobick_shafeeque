import 'package:flutter/foundation.dart';
import 'package:jobick_shafeeque/core/hive_db_functions.dart';
import 'package:jobick_shafeeque/core/models/table_model.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'base_model.dart';

class DashBoardViewModel extends BaseModel {
  final DashBoardRepository repository;
  final AppDatabase db;
  DashBoardViewModel({required this.db ,required this.repository});



  List<JobModel>? _tableValues ;



  void initialize() {

    db.getAllJobs().then((value) {
      if (value.isNotEmpty) {
        _tableValues = value;
        notifyListeners();
      } else {
        db.addJob( JobModel(
          id: 1,
            position: "Position",
            type: "Type",
            postedDate: "Posted Date",
            lastDateToApply: 'Last Date To Apply',
            closeDate: 'Close Date',
            status: 'Status',
            actions: 'Actions',
            isTitle: true));
        db.getAllJobs().then((value) {
          _tableValues = value;
          notifyListeners();
        });
      }
    });
  }

  List<JobModel>? get tableValues => _tableValues;

  void getAllJobs() {
    db.getAllJobs().then((value) {
      _tableValues = value;
      notifyListeners();
    });
  }

  void deleteJob(JobModel item) {
    db.deleteJob(item).then((value) {
      tableValues!.remove(item);
      notifyListeners();
    });
  }
}
