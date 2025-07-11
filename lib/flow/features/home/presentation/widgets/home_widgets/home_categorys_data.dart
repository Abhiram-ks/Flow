import '../../../../../core/utils/app_image.dart';

class CategoryData {
  static List<Map<String, String>> get categories => [
        {
          "title": "Food\nDelivery",
          "image": AppImages.fooddelivery,
          "discount": "10% Off"
        },
        {
          "title": "Medicines",
          "image": AppImages.medicines,
          "discount": "10% Off"
        },
        {
          "title": "Pet\nSupplies",
          "image":  AppImages.petSupplies,
          "discount": "10% Off"
        },
        {
          "title": "Gifts",
          "image":  AppImages.gifts,
        },
        {
          "title": "Meat",
          "image":  AppImages.meat,
        },
        {
          "title": "Cosmetic",
          "image":  AppImages.cosmetic,
        },
        {
          "title": "Stationery",
          "image":  AppImages.stationery,
        },
        {
          "title": "Stores",
          "image": AppImages.store,
          "discount": "10% Off"
        },
      ];
}