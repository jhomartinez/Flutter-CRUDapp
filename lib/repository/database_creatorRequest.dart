import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
  static const requestTable = 'r_request';
  static const r_request_id = 'r_request_id';
  static const documentno = 'documentno';
  static const ad_client_id = 'ad_client_id';
  static const ad_org_id = 'ad_org_id';
  static const isActive = 'isActive';
  static const created = 'created';
  static const createdby = 'createdby';
  static const updated = 'updated';
  static const updatedby = 'updatedby';
  static const result = 'result';
  static const task_status = 'task_status';
  static const r_requesttype_id = 'r_requesttype_id';
  static const r_group_id = 'r_group_id';
  static const r_category_id = 'r_category_id';
  static const duedate = 'duedate';
  static const startdate = 'startdate';
  static const enddate = 'enddate';
  static const starttime = 'starttime';
  static const endtime = 'endtime';
  static const qtyplan = 'qtyplan';
  static const qtyspent = 'qtyspent';
  static const summary = 'summary';
  static const salesrep_id = 'salesrep_id';
  static const r_status_id = 'r_status_id';
  static const priority = 'priority';
  static const priorityuser = 'priorityuser';
  static const color = 'color';
  static const qtyinvoiced = 'qtyinvoiced';
  static const previous_task_id = 'previous_task_id';
  static const next_task_id = 'next_task_id';
  static const aD_User_id = 'aD_User_id';
  static const aD_Role_id = 'aD_Role_id';
  static const r_Request_UU_id = 'r_Request_UU_id';
  static const c_Bpartner_id = 'c_Bpartner_id';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult, List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createRequestTable(Database db) async {
    final todoSql = '''CREATE TABLE $requestTable
    (
      $r_request_id INTEGER PRIMARY KEY,
      $documentno TEXT,
      $ad_client_id INTEGER,
      $ad_org_id INTEGER,
      $isActive TEXT,
      $created NUMERIC,
      $createdby INTEGER,
      $updated NUMERIC,
      $updatedby INTEGER,
      $result TEXT,
      $task_status TEXT,
      $r_requesttype_id INTEGER,
      $r_group_id INTEGER,
      $r_category_id INTEGER,
      $duedate NUMERIC,
      $startdate NUMERIC,
      $enddate NUMERIC,
      $starttime NUMERIC,
      $endtime NUMERIC,
      $qtyplan REAL,
      $qtyspent REAL,
      $summary TEXT,
      $salesrep_id INTEGER,
      $r_status_id INTEGER,
      $priority TEXT,
      $priorityuser TEXT,
      $color TEXT,
      $qtyinvoiced REAL,
      $previous_task_id INTEGER,
      $next_task_id INTEGER,
      $aD_User_id INTEGER,
      $aD_Role_id INTEGER,
      $r_Request_UU_id INTEGER,
      $c_Bpartner_id INTEGER,
    )''';
    await db.execute(todoSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('request_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createRequestTable(db);
  }
}