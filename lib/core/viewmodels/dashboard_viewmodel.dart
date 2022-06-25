import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'base_model.dart';

class DashBoardViewModel extends BaseModel {
  final DashBoardRepository repository;
  final AppDatabase db;
  DashBoardViewModel({required this.repository, required this.db});



  List<Job>? _tableValues;



  void initialize() {
    db.getAllJobs().then((value) {
      if (value.isNotEmpty) {
        _tableValues = value;
        notifyListeners();
      } else {
        db.insertTask(Job(
            columnPosition: "Position",
            columnType: "Type",
            columnPostedDate: "Posted Date",
            columnLastDateToApply: 'Last Date To Apply',
            columnCloseDate: 'Close Date',
            columnStatus: 'Status',
            columnActions: 'Actions',
            columnIsTitle: true));
        db.getAllJobs().then((value) {
          _tableValues = value;
          notifyListeners();
        });
      }
    });
  }

  List<Job>? get tableValues => _tableValues;

  void getAllJobs() {
    db.getAllJobs().then((value) {
      _tableValues = value;
      notifyListeners();
    });
  }

  void deleteJob(Job item) {
    db.deleteTask(item).then((value) {
      tableValues!.remove(item);
      notifyListeners();
    });
  }
}
