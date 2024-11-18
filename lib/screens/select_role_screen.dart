import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/category_provider.dart';
import '../utils/colors.dart';
import '../utils/routes/routes_name.dart';

class SelectRoleScreen extends StatefulWidget {
  // required this.id,required this.name, required this.image,

  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void _loadData(id) async {}

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String value1 = data!['id'].toString();
    final String value2 = data['name'].toString();
    final String value3 = data['image'].toString();

    Provider.of<CategoryProvider>(context, listen: false).getSubCategoryList(
      value1,
    );

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Consumer<CategoryProvider>(builder: (context, category, child) {
          return category.isLoading || category.subCategoryList == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 500,
                      width: 500,
                      margin: const EdgeInsets.only(right: 25, left: 25),
                      decoration: const BoxDecoration(
                          color: AppColors.whitebackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Image.network(
                            value3,
                            height: 150,
                            width: 150,
                            color: AppColors.textColor,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            value2,
                            style: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Please select your current role",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: category.subCategoryList!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      debugPrint('child cat id ==>' +
                                          category.subCategoryList![index].id
                                              .toString() +
                                          "parent cat id" +
                                          category
                                              .subCategoryList![index].parentId
                                              .toString());

                                      category.saveCategory(
                                          category.subCategoryList![index].id
                                              .toString(),
                                          category.categoryList![index].id
                                              .toString(),
                                          category
                                              .subCategoryList![index].parentId
                                              .toString());

                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RoutesName.home,
                                          (route) => route.isFirst);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(13))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            category.subCategoryList?[index]
                                                    .name ??
                                                'No name found',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }));
  }
}
