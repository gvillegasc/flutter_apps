class ActivityItem {
  ActivityItem({
    required this.day,
    required this.persons,
  });

  String day;
  List<Person> persons;
}

class Person {
  Person({
    required this.image,
    required this.name,
    required this.ago,
    required this.total,
    required this.more,
  });

  String image;
  String name;
  String ago;
  double total;
  bool more;
}
