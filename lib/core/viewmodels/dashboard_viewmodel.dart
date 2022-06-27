import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:drift/drift.dart' as dr;
part 'dashboard_viewmodel.g.dart';

enum StoreState { initial, loading, loaded }

class DashBoardViewModel extends _DashBoardViewModel with _$DashBoardViewModel {
  DashBoardViewModel(DashBoardRepository repository,AppDatabase db) : super(repository,db);
}

abstract class _DashBoardViewModel with Store {
  final DashBoardRepository _repository;
  final AppDatabase _db;
  _DashBoardViewModel(this._repository,this._db);


  @observable
  List<Job>? tableValues;

  @computed
  StoreState get state {
    if (tableValues == null) {
      return StoreState.loading;
    }
    return tableValues!.isEmpty
        ? StoreState.initial
        : StoreState.loaded;
  }



  @action
  Future initialize()async {
    _db.getAllJobs().then((value) {
      if (value.isNotEmpty) {
        tableValues = value;
      } else {
        _db.insertTask(const JobsCompanion(
            columnPosition: dr.Value("Position"),
            columnType: dr.Value("Type"),
            columnPostedDate: dr.Value("Posted Date"),
            columnLastDateToApply: dr.Value('Last Date To Apply'),
            columnCloseDate: dr.Value('Close Date'),
            columnStatus: dr.Value('Status'),
            columnActions: dr.Value('Actions'),
            columnIsTitle: dr.Value(true)));
        _db.getAllJobs().then((value) {
          tableValues = value;
        });
      }
    });
  }


  @action
  Future getAllJobs() async{
    _db.getAllJobs().then((value) => {
      tableValues = value
    });
  }

  @action
  void deleteJob(Job item) {
    _db.deleteTask(item).then((value) {
      tableValues!.remove(item);
    });
  }

}
