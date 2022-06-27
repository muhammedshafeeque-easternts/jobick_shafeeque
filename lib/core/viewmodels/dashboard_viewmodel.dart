import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'package:mobx/mobx.dart';
import 'base_model.dart';
import 'package:drift/drift.dart' as dr;
part 'dashboard_viewmodel.g.dart';

enum StoreState { initial, loading, loaded }
class DashBoardViewModel  {
  final DashBoardRepository repository;
  final AppDatabase db;
  DashBoardViewModel({required this.repository, required this.db});


  @observable
  ObservableFuture<List<Job>?>? _tableValuesFuture;

  @observable
  List<Job>? _tableValues;

  @computed
  StoreState get state {
    if (_tableValuesFuture == null ||
        _tableValuesFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _tableValuesFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  void initialize()async {
   if(_tableValues!.isEmpty){
     db.insertTask(const JobsCompanion(
         columnPosition: dr.Value("Position"),
         columnType: dr.Value("Type"),
         columnPostedDate: dr.Value("Posted Date"),
         columnLastDateToApply: dr.Value('Last Date To Apply'),
         columnCloseDate: dr.Value('Close Date'),
         columnStatus: dr.Value('Status'),
         columnActions: dr.Value('Actions'),
         columnIsTitle: dr.Value(true)));
     _tableValuesFuture =
         ObservableFuture(db.getAllJobs());
     _tableValues = await _tableValuesFuture ;
     return ;
   }
   _tableValuesFuture =
       ObservableFuture(db.getAllJobs());
   _tableValues = await _tableValuesFuture ;
  }


  @action
  void getAllJobs() async{
    _tableValuesFuture =
        ObservableFuture(db.getAllJobs());
    _tableValues = await _tableValuesFuture ;
  }

  @action
  void deleteJob(Job item) {
    db.deleteTask(item).then((value) {
      _tableValues!.remove(item);
    });
  }

}
