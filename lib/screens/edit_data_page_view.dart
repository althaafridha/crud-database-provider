import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/data.dart';
import '../providers/edit_data_provider.dart';
import '../widgets/textfield_decoration.dart';

class EditDataPageView extends StatelessWidget {
  final String idData;
  final DataModel data;

  const EditDataPageView({Key? key, required this.idData, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditDataProvider>(
      create: (context) => EditDataProvider(),
      child: Consumer<EditDataProvider>(
        builder: (context, provider, _) {
          provider.setData(data);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
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
                        child:
                            const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Edit Data",
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
                        controller: provider.title,
                        decoration: const InputDecoration(
                          hintText: "Title",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    textFieldDecoration(
                      height: 350,
                      child: TextFormField(
                        maxLines: 5,
                        controller: provider.description,
                        decoration: const InputDecoration(
                          hintText: "Description",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        provider.submitForm(
                            idData, provider.title, provider.description, context);
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
                          child: Text(
                            "Update Data",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
