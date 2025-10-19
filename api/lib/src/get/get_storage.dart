import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



class InsertData extends StatelessWidget {
  InsertData({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Blacktext(text: "Fetch"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FetchData()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Blacktext(text: "Insert Data", fontSize: 24, fontWeight: FontWeight.w700),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Insert Data Please",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                GetStorage getStorage = GetStorage();
                await getStorage.write("name", controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Data Saved!")),
                );
              },
              child: Blacktext(text: 'Insert Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  String name = '';
  final GetStorage getStorage = GetStorage();

  void fetchData() async {
    String? fetchedName = await getStorage.read('name');
    setState(() {
      name = fetchedName ?? 'NO DATA FOUND';
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Blacktext(text: "Update"),
              onPressed: () async {
                // Navigate to UpdateData and wait for result
                await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateData()));
                fetchData(); // Fetch data again after returning from UpdateData
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Blacktext(text: 'Fetch Data', fontSize: 24, fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Blacktext(
              text: name,
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await getStorage.remove('name');
                setState(() {
                  name = "NO DATA FOUND";
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Data Deleted!")),
                );
              },
              child: Blacktext(text: "Delete"),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateData extends StatelessWidget {
  UpdateData({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Blacktext(text: "Update Data", fontSize: 24, fontWeight: FontWeight.w700),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Insert New Data Please",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                GetStorage getStorage = GetStorage();
                await getStorage.write('name', controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Data Updated!")),
                );
                Navigator.pop(context);
              },
              child: Blacktext(text: 'Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}