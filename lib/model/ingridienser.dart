class Ingridiens {
  String? id; // Unikt ID för ingrediensen
  String? ingridienserText; // Text som beskriver ingrediensen
  String? name; // Namn på ingrediensen
  bool isDone; // Flagga för om ingrediensen är klar

  // Konstruktor för Ingridiens
  Ingridiens({
    required this.id,
    required this.ingridienserText,
    this.name, // Valfritt namn
    this.isDone = false, // Standardvärde för isDone är false
  });

  // Statisk metod som returnerar en lista över ingredienser
  static List<Ingridiens> ingridienserLista() {
    return [
      Ingridiens(id: '01', ingridienserText: 'NÅGRA KVISTAR FÄRSK MYNTA', isDone: true, name: 'Mynta'),
      Ingridiens(id: '02', ingridienserText: '2 CL PRESSAD LIMEJUICE', isDone: true, name: 'Limejuice'),
      Ingridiens(id: '03', ingridienserText: '2 CL SOCKERLAG', name: 'Sockerlag'),
      Ingridiens(id: '04', ingridienserText: '4 CL VIT ROM', name: 'Vit Rom'),
      Ingridiens(id: '05', ingridienserText: 'SODA VATTEN', name: 'Soda'),
    ];
  }
}