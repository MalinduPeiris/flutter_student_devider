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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Group Devider App'),
        ),
        body: isSubmit == false
            ? Column(
                children: [
                  const SizedBox(
                    height: 300.0,
                  ),
                   const SizedBox(
                    width: 660.0,
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
                const SizedBox(height: 50.0),
                Center(
                  child: TextField(
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    controller: _txtSubmit, // Text color
                    decoration: const InputDecoration(
                      hintText: 'Enter student name here',
                      hintStyle: TextStyle(
                          color:
                              Color.fromARGB(179, 0, 0, 0)), // Hint text color
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(height: 40.0), // Spacer
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
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                         isSubmit == true
                              ? _divideToGroups()
                              : null;
                        });
                      },
                      child: const Text('Divide to group'),
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
                            color:const Color.fromARGB(255, 255, 254, 202),
                            border: Border.all(
                                color:const Color.fromARGB(
                                    255, 0, 0, 0)), // Set your border color
                            borderRadius: BorderRadius.circular(
                                8.0), // Set your border radius
                          ),
                          child: ListTile(
                            title: Text(stList[index]),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ]));
  }

  void _divideToGroups() {
    List<List<String>> dividedGroups = List.generate(3, (index) => []);
    for (int i = 0; i < stList.length; i++) {
      dividedGroups[i % 3].add(stList[i]);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupsPage(dividedGroups: dividedGroups),
      ),
    );
  }
}

class GroupsPage extends StatelessWidget {
  //const GroupsPage ({super.key});

 List<List<String>> dividedGroups;

  GroupsPage({required this.dividedGroups});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomly Divide Students'),
      ),
      body: ListView.builder(
        itemCount: dividedGroups.length,
        itemBuilder: (context, groupIndex) {
          return Card(
            child: ListTile(
              title: Text('Group ${groupIndex + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: dividedGroups[groupIndex].map((student) {
                  return Text(student);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

