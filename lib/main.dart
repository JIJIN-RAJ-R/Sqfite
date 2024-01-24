// main.dart
import 'package:flutter/material.dart';
import 'sql_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes data',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  bool _validateImage = false;
  bool _validateTitle = false;
  bool _validateDescription = false;
  bool _validatePrice = false;

  void _showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
      _priceController.text = existingJournal['price'].toString();
      _imageController.text = existingJournal['imageUrl'].toString();
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                  hintText: 'Image Url',
                  errorText: _validateImage ? 'Please Enter Url' : null),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: 'Title',
                  errorText: _validateTitle ? 'please Enter title' : null),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  hintText: 'Description',
                  errorText: _validateDescription ? 'Enter desciption' : null),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                  hintText: 'Price',
                  errorText: _validatePrice ? 'Enter price' : null),
            ),
            const SizedBox(height: 30),
            Row(children: [
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addItem();
                  } else {
                    await _updateItem(id);
                  }

                  _clearTextFields();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
                child: Text(
                  id == null ? 'Create New' : 'Update',
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  _clearTextFields();
                },
                child: const Text(
                  'Clear',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ])
          ],
        ),
      ),
    );
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
      _titleController.text,
      _descriptionController.text,
      _priceController.text,
      _imageController.text,
    );
    _refreshJournals();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
      id,
      _titleController.text,
      _descriptionController.text,
      _priceController.text,
      _imageController.text,
    );
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  void _clearTextFields() {
    _titleController.text = '';
    _descriptionController.text = '';
    _priceController.text = '';
    _imageController.text = '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.menu_rounded,
              size: 30,
              color: Colors.black,
            )),
        title: const Text(
          'COMMON PROJECTS',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          const Text(
            '2',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.checkroom_sharp,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      backgroundColor: Colors.green[100],
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 25.0,
              ),
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                // color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        subtitle: Column(
                          children: [
                            Image.network(
                                _journals[index]['imageUrl'].toString()),
                            Text(
                              _journals[index]['title'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_journals[index]['description']),
                                const SizedBox(width: 10),
                                const Text('\$',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent)),
                                Text(
                                  _journals[index]['price'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () =>
                                      _deleteItem(_journals[index]['id']),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () =>
                                      _showForm(_journals[index]['id']),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton:
          // mainAxisAlignment: MainAxisAlignment.center,
          // children: [
          FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _showForm(null),
      ),
      // ],
      // ),
    );
  }
}
