import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'base_model.dart';
import 'package:drift/drift.dart' as dr;

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
        db.insertTask(const JobsCompanion(
            columnPosition: dr.Value("Position"),
            columnType: dr.Value("Type"),
            columnPostedDate: dr.Value("Posted Date"),
            columnLastDateToApply: dr.Value('Last Date To Apply'),
            columnCloseDate: dr.Value('Close Date'),
            columnStatus: dr.Value('Status'),
            columnActions: dr.Value('Actions'),
            columnIsTitle: dr.Value(true)));
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
