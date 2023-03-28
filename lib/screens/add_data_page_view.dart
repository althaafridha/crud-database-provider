import 'package:crud_database_provider/providers/add_data_provider.dart';
import 'package:crud_database_provider/widgets/textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDataPageView extends StatefulWidget {
  const AddDataPageView({super.key});

  @override
  State<AddDataPageView> createState() => _AddDataPageViewState();
}

class _AddDataPageViewState extends State<AddDataPageView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddDataProvider(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Consumer<AddDataProvider>(
              builder: (context, value, child) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Add Data",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        textFieldDecoration(
                            child: TextFormField(
                          maxLines: 1,
                          controller: value.titleController,
                          decoration: const InputDecoration(
                            hintText: "Title",
                            border: InputBorder.none,
                          ),
                        )),
                        const SizedBox(height: 20),
                        textFieldDecoration(
                            height: 350,
                            child: TextFormField(
                              maxLines: 5,
                              controller: value.descriptionController,
                              decoration: const InputDecoration(
                                hintText: "Description",
                                border: InputBorder.none,
                              ),
                            )),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            value.check();
                            Navigator.pushNamed(context, '/');
                          },
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: Text("Save Data",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
