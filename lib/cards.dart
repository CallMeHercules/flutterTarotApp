class Cards {
  final String? type;
  final String? name_short;
  final String? name;
  final String? value;
  final int? value_int;
  final String? meaning_up;
  final String? meaning_rev;
  final String? desc;

  Cards({
    required this.type
    , required this.name_short
    , required this.name
    , required this.value
    , required this.value_int
    , required this.meaning_up
    , required this.meaning_rev
    , required this.desc
  });

  factory Cards.fromMap(Map<String, dynamic> cardJson) => Cards(
    type : cardJson['type'],
    name_short : cardJson['name_short'],
    name : cardJson['name'],
    value : cardJson['value'],
    value_int : cardJson['value_int'],
    meaning_up : cardJson['meaning_up'],
    meaning_rev : cardJson['meaning_rev'],
    desc : cardJson['desc'],
  );

  static Cards toList(Map<String, dynamic> json) => Cards(
    type : json['type'],
    name_short : json['name_short'],
    name : json['name'],
    value : json['value'],
    value_int : json['value_int'],
    meaning_up : json['meaning_up'],
    meaning_rev: json['meaning_rev'],
    desc : json['desc'],
  );

  Map<String, dynamic> toMap() {
    return {
      'type' : type,
      'name_short' : name_short,
      'name' : name,
      'value' : value,
      'value_int' : value_int,
      'meaning_up' : meaning_up,
      'meaning_rev' : meaning_rev,
      'desc' : desc,
    };
  }
}