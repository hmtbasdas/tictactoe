import 'manager_model.dart';

class Manager {
  static final Manager instance = Manager._internal();
  factory Manager() {return instance;}
  Manager._internal();
  ManagerModel managerModel = ManagerModel();
}