import 'package:flutter/material.dart';
import '../model/ingridienser.dart'; // Importerar modellklassen Ingridiens

// Definierar en StatefulWidget för att hantera skärmen med ingredienser
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// State-klassen som hanterar tillstånd för Home-widgeten
class _HomeState extends State<Home> {
  final ingridienserLista = Ingridiens.ingridienserLista(); // Hämtar ingredienslistan från modellen

  // Variabel för att spåra vilken flik som är vald
  int _selectedIndex = 0;

  // Hanterar navigationsbarens valda index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Uppdaterar vald sida när användaren trycker på en flik
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 162, 179), // Bakgrundsfärg för skärmen
      appBar: _appBar(), // Använder en metod för att skapa en AppBar
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Inre marginal runt innehållet
        child: Column(
          children: [
            searchBox(), // Lägger till en sökfält-widget
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20), // Marginal för Mojito-texten
                    child: const Center(
                      child: Text(
                        'Mojito',
                        style: TextStyle(
                          fontSize: 40, // Storlek på Mojito-texten
                          fontWeight: FontWeight.w800, // Textens vikt (tjocklek)
                        ),
                      ),
                    ),
                  ),
                  // Loopar genom ingredienslistan och skapar en IngridiensItem-widget för varje ingrediens
                  for (Ingridiens ingridienser in ingridienserLista)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10), // Utrymme mellan boxarna
                      child: IngridienserItem( // Kallar på en widget för att hantera enskilda ingredienser
                        ingridienser: ingridienser, // Skickar varje ingrediens till widgeten
                        onIngridiensChange: _handleIngridiensChange, // Hanterar förändringar
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Nedan navigationsbar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex, // Markera vilken flik som är vald
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

  // Funktion som hanterar ändringar i ingrediensernas tillstånd
  void _handleIngridiensChange(Ingridiens ingridienser) {
    setState(() {
      ingridienser.isDone = !ingridienser.isDone; // Växlar ingrediensens status mellan klar/inte klar
    });
  }

  // Sökfält-widget
  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white, // Sökfältets bakgrundsfärg
        borderRadius: BorderRadius.circular(20), // Rundade hörn på sökfältet
      ),
      child: TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10), // Marginal inuti textfältet
          prefixIcon: Icon(
            Icons.search, // Lägger till en sökikon i textfältet
            color: Color.fromARGB(255, 54, 166, 17),
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none, // Ingen synlig kant på textfältet
          hintText: 'Search', // Platshållartext i sökfältet
          hintStyle: TextStyle(color: Color.fromARGB(255, 54, 12, 191)), // Stil för platshållartext
        ),
      ),
    );
  }

  // AppBar-widget för att skapa en toppmeny
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(210, 40, 224, 23), // Färg på AppBar
      elevation: 0, // Ingen skugga under AppBar
      title: const Text("Ingridienser"), // AppBar-titel
    );
  }
}

// Widget som hanterar en enskild ingrediens
class IngridienserItem extends StatelessWidget {
  final Ingridiens ingridienser; // Ingrediensen som skickas till widgeten
  final Function(Ingridiens) onIngridiensChange; // Funktion för att hantera förändringar

  const IngridienserItem({required this.ingridienser, required this.onIngridiensChange});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(ingridienser.ingridienserText!), // Ändrad till att använda rätt namn
        trailing: Checkbox(
          value: ingridienser.isDone,
          onChanged: (bool? value) {
            onIngridiensChange(ingridienser);
          },
        ),
      ),
    );
  }
}