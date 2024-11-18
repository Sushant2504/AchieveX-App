class Notes {
  final String title;
  final String description;
   int? id;

  Notes({required this.title, required this.description,this.id});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id':id,
    };
  }
}