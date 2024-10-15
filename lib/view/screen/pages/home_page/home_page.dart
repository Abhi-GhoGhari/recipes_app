import 'package:recipes_app/headers.dart';

import '../../../../controller/recipe_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController recipeController = RecipeController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _catagoryController = TextEditingController();
    TextEditingController _priceController = TextEditingController();
    final CollectionReference _productsCollection =
        FirebaseFirestore.instance.collection('products');

    void _addProduct() async {
      String name = _nameController.text;
      if (name.isNotEmpty) {
        await _productsCollection.add({'name': name});
        _nameController.clear();
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HomePage"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Add Product"),
              content: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    controller: _catagoryController,
                    decoration: const InputDecoration(hintText: "Catagory"),
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: const InputDecoration(hintText: "Price"),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    _addProduct();
                  },
                  child: const Text("Save"),
                )
              ],
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: RecipeController().allRecipe.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(
              recipeController.allRecipe[index].name,
            ),
          ),
        ),
      ),
    );
  }
}
