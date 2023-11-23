import 'package:flutter/material.dart';


class GroupMaker extends StatefulWidget {
  GroupMaker({super.key});

  @override
  State<GroupMaker> createState() => _groupMakerState();
}

class _groupMakerState extends State<GroupMaker> {

  final TextEditingController _txtSubmit = TextEditingController();
  List<String> stList = [];

  bool isSubmit = false;


  @override
  Widget build(BuildContext context) {
    return isSubmit == false
        ? Column(
            children: [

              const SizedBox(
                height: 300.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSubmit = true;
                  });
                },
                child: const Text('Login to student devide app'),
              ),
            ],
          )


        : Column(children: [

            const SizedBox(height: 70.0),
            Center(
              child: TextField(
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: _txtSubmit, // Text color
                decoration: const InputDecoration(
                  hintText: 'Enter student name here',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(179, 0, 0, 0)), // Hint text color
                  border: OutlineInputBorder(),
                ),
              ),
            ),


            const SizedBox(height: 20.0), // Spacer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      stList.add(_txtSubmit.text);
                      _txtSubmit.clear();
                      //print(stList);
                    });
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      stList.shuffle();
                      //print(stList);
                    });
                  },
                  child: const Text('Shuffle'),
                ),
              ],
            ),


            const SizedBox(height: 50.0),
            Expanded(
                child: Card(
                  child: ListView.builder(
                    itemCount: stList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(9.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 254, 202),
                          border: Border.all(color: Color.fromARGB(255, 0, 0, 0)), // Set your border color
                          borderRadius: BorderRadius.circular(8.0), // Set your border radius
                        ),
                        child: ListTile(
                          title: Text(stList[index]),
                        ),
                      );
                    },
                  ),
                ),)


          ]);
  }
}
