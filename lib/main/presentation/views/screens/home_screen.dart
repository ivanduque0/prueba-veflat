import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_veflat/main/domain/entities/character.dart';
import 'package:prueba_veflat/main/presentation/routes/main_navigation.dart';
import 'package:prueba_veflat/ui/widgets/button.dart';
import 'package:prueba_veflat/ui/widgets/product_card.dart';
import 'package:prueba_veflat/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../ui/theme.dart';
import '../../../../ui/widgets/home_app_bar.dart';
import '../../getx/main_controller.dart';
import 'package:prueba_veflat/utils/miscellaneous.dart';
class HomeScreen extends GetWidget<MainController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controllerListerner();
    return Scaffold(
      backgroundColor: primaryBackgroundClr,
      appBar: HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Text(
                "Find your clothes",
              style: titleTextStyle,
              textAlign: TextAlign.start,),
            ),
            advertisement(context),
            genders(),
            productList()
          ],
        )
      ),
    );
  }

  controllerListerner(){
    controller.scrollController.addListener(() async {
      if (controller.noMoreCharacters.value || controller.retrievengProducts.value) return;
      if (controller.scrollController.position.maxScrollExtent==controller.scrollController.offset) {
        controller.currentCharactersPage++;
        controller.retrievengProducts(true);
        await controller.setCharacters(other_gendertrue: false);
        controller.retrievengProducts(false);
      }
    });
  }

  selectGenderIndex(int index) async {
    bool other_gender= controller.genderIndex.value!=index;
    if (!other_gender) return; 
    controller.genderIndex(index);
    controller.setCharacters(other_gendertrue: other_gender);
    controller.scrollController.jumpTo(0);
  }

  Widget advertisement(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              height:  MediaQuery.of(context).size.width/1.72,
              // height: 250,
              "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/09/Morty-as-Wendys-french-toast.jpg",
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 250.0,
                    child: Shimmer.fromColors(
                      baseColor: Color.fromARGB(255, 206, 206, 206),
                      highlightColor: Color.fromARGB(255, 152, 152, 152),
                      child:  Container(
                        decoration: BoxDecoration(
                        color: white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      )
                      
                    ),
                  );
              },
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Button(
                width: 110,
                height:40,
                fontSize: 17,
                borderRadius: 8,
                label: "Grab Now", 
                onTap: (){
                },
                color: black,
            )
          )
        ],
      ),
    );
  }

  Widget genders(){
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.symmetric(vertical: 25),
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
      itemCount: Constants.genders.length,
      separatorBuilder: (context, index) => SizedBox(
        width: 20,
      ),
      itemBuilder:(context, index) {
        return Center(
          child: Obx(()=> Button(
              label: Constants.genders[index].capitalizeFirstLetter(), 
              textColor: controller.genderIndex.value==index?white:black,
              borderColor: controller.genderIndex.value==index?black:grey,
              color: controller.genderIndex.value==index?black:null,
              onTap: (){
                selectGenderIndex(index);
              }),
          )
          // child: Text(Constants.genders[index])
        );
      }),
    );
  }

  Widget productList(){
    return Container(
      height: 330,
      child: Obx(()=>controller.showProducts.value?ListView.separated(
        controller: controller.scrollController,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
          itemCount: controller.characters.isNotEmpty?controller.characters.length+1:3,
          itemBuilder:(context, index) {
           
            if (controller.characters.isEmpty) {
              return ProductCard(
                character: Character.empty(),
                loading: true,
                onTap: (){},
              );
            }
            if (index<controller.characters.length) {
              return ProductCard(
                character: controller.characters[index],
                favorite: controller.isfavoriteProduct(controller.characters[index].id),
                onTap: (){
                  controller.character!(controller.characters[index]);
                  controller.updateCartItem(controller.cartItem.value.copyWith(
                    color:Constants.colors[0], 
                    size: Constants.sizes[0], 
                    quantity: 1, 
                    price:(controller.characters[index].name!.length*10),
                    character: controller.characters[index]
                  ));
                  controller.descriptionExpanded(false);
                  Get.toNamed(MainRoutes.product);
                },
              );
            } else if(!controller.noMoreCharacters.value) {
              return ProductCard(
                character: Character.empty(),
                loading: true,
                onTap: (){},
              );
            }
          },
        ):SizedBox.shrink(),
      ),
    ); 
  }

}

