
import 'package:crudApp/repository/database_creatorRequest.dart';

class Request {
int requestId;
String documentno;
int adClientId;
int adOrgId;
bool isActive;
double created;
int createdby;
double updated;
int updatedby;
String result;
String taskStatus;
int rRequesttypeId;
int rGroupId;
int rCategoryId;
double duedate;
double startdate;
double enddate;
double starttime;
double endtime;
String qtyplan;
String qtyspent;
String summary;
int salesrepId;
int rStatusId;
String priority;
String priorityuser;
String color;
String qtyinvoiced;
int previousTaskId;
int nextTaskId;
int aDUserId;
int aDRoleId;
int rRequestUUId;
int cBpartnerId;

Request(
  this.requestId,
  this.documentno,
  this.adClientId,
  this.adOrgId,
  this.isActive,
  this.created,
  this.createdby,
  this.updated,
  this.updatedby,
  this.result,
  this.taskStatus,
  this.rRequesttypeId,
  this.rGroupId,
  this.rCategoryId,
  this.duedate,
  this.startdate,
  this.enddate,
  this.starttime,
  this.endtime,
  this.qtyplan,
  this.qtyspent,
  this.summary,
  this.salesrepId,
  this.rStatusId,
  this.priority,
  this.priorityuser,
  this.color,
  this.qtyinvoiced,
  this.previousTaskId,
  this.nextTaskId,
  this.aDUserId,
  this.aDRoleId,
  this.rRequestUUId,
  this.cBpartnerId
          );


Request.fromJson(Map<String, dynamic> json){
  this.requestId = json[DatabaseCreator.r_request_id];
  this.documentno = json[DatabaseCreator.documentno];
  this.adClientId = json[DatabaseCreator.ad_client_id];
  this.adOrgId = json[DatabaseCreator.ad_org_id];
  this.isActive = json[DatabaseCreator.isActive];
  this.created = json[DatabaseCreator.created];
  this.createdby = json[DatabaseCreator.createdby];
  this.updated = json[DatabaseCreator.updated];
  this.updatedby = json[DatabaseCreator.updatedby];
  this.result = json[DatabaseCreator.result];
  this.taskStatus = json[DatabaseCreator.task_status];
  this.rRequesttypeId = json[DatabaseCreator.r_requesttype_id];
  this.rGroupId = json[DatabaseCreator.r_group_id];
  this.rCategoryId = json[DatabaseCreator.r_category_id];
  this.duedate = json[DatabaseCreator.duedate];
  this.startdate = json[DatabaseCreator.startdate];
  this.enddate = json[DatabaseCreator.enddate];
  this.starttime = json[DatabaseCreator.starttime];
  this.endtime = json[DatabaseCreator.endtime];
  this.qtyplan = json[DatabaseCreator.qtyplan];
  this.qtyspent = json[DatabaseCreator.qtyspent];
  this.summary = json[DatabaseCreator.summary];
  this.salesrepId = json[DatabaseCreator.salesrep_id];
  this.rStatusId = json[DatabaseCreator.r_status_id];
  this.priority = json[DatabaseCreator.priority];
  this.priorityuser = json[DatabaseCreator.priorityuser];
  this.color = json[DatabaseCreator.color];
  this.qtyinvoiced = json[DatabaseCreator.qtyinvoiced];
  this.previousTaskId = json[DatabaseCreator.previous_task_id];
  this.nextTaskId = json[DatabaseCreator.next_task_id];
  this.aDUserId = json[DatabaseCreator.aD_User_id];
  this.aDRoleId = json[DatabaseCreator.aD_Role_id];
  this.rRequestUUId = json[DatabaseCreator.r_Request_UU_id];
  this.cBpartnerId = json[DatabaseCreator.c_Bpartner_id];
}