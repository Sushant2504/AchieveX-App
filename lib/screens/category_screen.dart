import 'package:achievex/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/model/response/category_model.dart';
import '../provider/category_provider.dart';
import '../utils/colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel categoryModel;
  // const CategoryScreen({super.key,required this.categoryModel});
  const CategoryScreen({super.key, required this.categoryModel});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
      
  late CategoryModel _categoryModel;
  final String _type = 'all';
  
  @override
  void initState() {
    super.initState();
    print("initstate is called");
    _loadData();
  }

  void _loadData() async {
    print("loaddata function is called !");

    _categoryModel = widget.categoryModel;
    Provider.of<CategoryProvider>(context, listen: false).getCategoryList(
      false,
    );

    print("data is loaded !"); 
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<CategoryProvider>(builder: (context, category, child) {
        return category.isLoading || category.categoryList == null
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ))
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Center(
                        child: Image.asset(
                          'assets/images/welcome_image.png', // Path to your image in assets
                          width: 250, // Width of the image
                          height: 220, // Height of the image
                        ),
                      ),

                      const Text(
                        "Welcome Champion",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: AppColors.whitebackgroundColor),
                      ),


                      const Text(
                        "Please select your category / Exam that you are currently preparing ",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: AppColors.whitebackgroundColor,
                        ),
                        textAlign: TextAlign.center,
                      ),


                      const SizedBox(
                        height: 30,
                      ),

                      
                      Wrap(children: [

                        GridView.builder(
                            shrinkWrap: true,
                            itemCount: category.categoryList!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 1,
                              crossAxisCount: 2,  
                            ),
                            itemBuilder: (context, index) {
                              Map<String, dynamic> arguments = {
                                'id':
                                    category.categoryList![index].id.toString(),
                                'name': category.categoryList![index].name
                                    .toString(),
                                'image':
                                    '${AppConstants.baseUrl}/storage/app/public/category/${category.categoryList![index].image}',
                              };

                              return InkWell(
                                onTap: () => {
                                 

                                  Navigator.of(context)
                                      .pushNamed('/select_role', arguments: {
                                    'id': category.categoryList![index].id,
                                    'name': category.categoryList![index].name,
                                    'image':
                                        '${AppConstants.baseUrl}/storage/app/public/category/${category.categoryList![index].image}',
                                  }),
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 140,
                                    width: 140,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: AppColors.neetColor),
                                    child: Center(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              '${AppConstants.baseUrl}/storage/app/public/category/${category.categoryList![index].image}',
                                              height: 50,
                                              width: 50,
                                            ),
                                            Text(
                                              category.categoryList![index]
                                                      .name ??
                                                  'No name found',
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .whitebackgroundColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ]),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  SingleChildScrollView categoryShimmer(
      BuildContext context, double height, CategoryProvider category) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: 1170,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/welcome_image.png', // Path to your image in assets
                          width: 250, // Width of the image
                          height: 220, // Height of the image
                        ),
                      ),
                      const Text(
                        "Welcome Champion",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: AppColors.whitebackgroundColor,
                            ),
                      ),
                      const Text(
                        "Please select your category / Exam that you are currently preparing ",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: AppColors.whitebackgroundColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Shimmer(
                    duration: const Duration(seconds: 2),
                    enabled: true,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              height: 140,
                              width: 140,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: AppColors.neetColor),
                              child: Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/neet_icon.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      const Text(
                                        '',
                                        style: TextStyle(
                                            color: AppColors.whitebackgroundColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            ),
                                      )
                                    ]),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
