class PriorNote {
  final String title;
  final String description;
   int? id;
   String? priority;
   String? isComplete;

  PriorNote({required this.title, required this.description,this.id,this.priority,this.isComplete});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id':id,
      'priority': priority,
      'is_complete': isComplete,
    };
  }
}