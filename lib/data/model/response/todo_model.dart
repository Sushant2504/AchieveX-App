class Todos {
   final String title;
   final String description;
    String isComplete;
    int? id;

  Todos({required this.title, required this.description, required this.isComplete,this.id});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'is_complete' : isComplete,
      'id': id,
    };
  }
}