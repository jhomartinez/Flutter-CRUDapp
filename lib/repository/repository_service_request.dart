import 'package:crudApp/models/request.dart';
import 'package:crudApp/repository/database_creatorRequest.dart';

class RepositoryServiceRequest {
  static Future<List<Request>> getAllRequests() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.requestTable}
    WHERE ${DatabaseCreator.isActive} = 0''';
    final data = await db.rawQuery(sql);
    List<Request> reqList = List();

    for (final node in data) {
      final req = Request.fromJson(node);
      reqList.add(req);
    }
    return reqList;
  }

  static Future<Request> getRequest(int id) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.requestTable}
    WHERE ${DatabaseCreator.r_request_id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final todo = Request.fromJson(data.first);
    return todo;
  }

  static Future<void> addTodo(Request req) async {
    final sql = '''INSERT INTO ${DatabaseCreator.requestTable}
    (
      ${DatabaseCreator.r_request_id},
      ${DatabaseCreator.result},
      ${DatabaseCreator.priority},
      ${DatabaseCreator.startdate},
      ${DatabaseCreator.enddate},
      ${DatabaseCreator.task_status},
      ${DatabaseCreator.isActive},
    )
    VALUES (?,?,?,?,?,?,?,?)''';
    List<dynamic> params = [req.requestId, req.result, req.priority,
     req.startdate, req.enddate, req.taskStatus, req.isActive ? 1 : 0];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add request', sql, null, result, params);
  }

  static Future<void> deleteRequest(Request req) async {
    final sql = '''UPDATE ${DatabaseCreator.requestTable}
    SET ${DatabaseCreator.isActive} = 1
    WHERE ${DatabaseCreator.r_request_id} = ?
    ''';
    List<dynamic> params = [req.requestId];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Delete reqest', sql, null, result, params);
  }

  static Future<void> updateRequest(Request req) async {
    final sql = '''UPDATE ${DatabaseCreator.requestTable}
    SET ${DatabaseCreator.result} = ?,
      ${DatabaseCreator.priority} = ?,
      ${DatabaseCreator.startdate} = ?,
      ${DatabaseCreator.enddate} = ?,
      ${DatabaseCreator.task_status} = ?,
    WHERE ${DatabaseCreator.r_request_id} = ?
    ''';

    List<dynamic> params = [req.result, req.priority, req.startdate,
    req.enddate, req.taskStatus, req.requestId];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update request', sql, null, result, params);
  }

  static Future<int> requestCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.requestTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}