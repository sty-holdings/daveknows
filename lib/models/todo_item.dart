class ToDoItem {
  String? toDoRefId;
  String? description;
  DateTime? lastUpdateTimestamp;
  String? navigation;
  String? status;

  ToDoItem() :
        toDoRefId = "",
        description = "",
        lastUpdateTimestamp = null,
        navigation = "",
        status = "";

  ToDoItem.fromJson(Map<String, dynamic> json, String? token)
      : toDoRefId = json['to_do_ref_id'],
        description = json['description'],
        lastUpdateTimestamp = json['last_update_timestamp'],
        navigation = json['navigation'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
    'to_do_ref_id': toDoRefId,
    'description': description,
    'navigation': navigation,
    'status': status
  };
}
