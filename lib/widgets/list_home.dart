import 'package:crud_database_provider/providers/home_provider.dart';
import 'package:crud_database_provider/screens/edit_data_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHome extends StatelessWidget {
  const ListHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EditDataPageView(
                              idData: value.list[index].idData!,
                              data: value.list[index],
                            ))),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value.list[index].title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 15),
                            Text(value.list[index].description!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            Text("Uploaded by: ${value.list[index].nama}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () => value.showMyDialog(
                              value.list[index].idData!, context),
                          child: const Icon(Icons.delete, color: Colors.red))
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
