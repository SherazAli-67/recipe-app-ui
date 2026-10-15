import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/asset_res.dart';
import 'package:recipe_app_ui/core/models/category_model.dart';
import 'package:recipe_app_ui/core/models/recipe_model.dart';

class AppData {
  static const categories = [
    CategoryModel(name: StringConst.seeAll, isSeeAll: true),
    CategoryModel(name: StringConst.soup, emoji: StringConst.soupImg),
    CategoryModel(name: StringConst.breakfast, emoji: StringConst.breakfastImg),
    CategoryModel(name: StringConst.salad, emoji: StringConst.saladImg),
  ];

  static const favoriteCategories = [
    StringConst.salad,
    StringConst.breakfast,
    StringConst.soup,
    StringConst.mainDish,
  ];

  static final recipes = [
    RecipeModel(
      id: '1',
      title: 'Creamy Pork Stew',
      description: 'This creamy pork stew features fall favorites like Brussels sprouts, cabbage, mushrooms, and root vegetables. Add squash if you like. And if pork doesn’t do it for you, this recipe is very versatile; Chef John also recommends “veal, beef, or chicken thighs.” Enjoy over steamed rice, mashed potatoes, or noodles.',
      imagePath: 'https://www.allrecipes.com/thmb/DWmWY5pWG_2YdonLpQzntvZAslE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/245361-creamy-pork-stew-Beauty-4x3-a56080e9b5a4462a8dad0a7661f6d1f4.jpg',
      cookTime: '30 mins',
      category: StringConst.soup,
      rating: 4.8,
      difficulty: 'Medium',
      ingredients: [
        'Lemongrass stalks',
        'Kaffir lime leaves',
        'Galangal',
        'Thai chili',
        'Mushrooms',
        'Shrimp or tofu',
        'Fish sauce',
        'Lime juice',
      ],
      directions:
          'Bring stock to a boil with lemongrass, galangal, and lime leaves. Add mushrooms and chili, then simmer. Season with fish sauce and lime juice. Finish with shrimp or tofu and serve hot.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '2',
      title: 'Easy Beef Bourguignon',
      description: 'In this classic French beef stew, lean beef cooks low and slow with onions, mushrooms, and red wine. “Very easy,” says reviewer DapperCake2399. “I added flour directly over everything. I seriously took my time because that’s the way I cook. It looks and tastes great, especially on our rainy Calif evenings!”',
      imagePath: 'https://www.allrecipes.com/thmb/7bUrkh8ay0aoxXf7xEMY5bKGym0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Easy-Beef-Bourguignon-France-C-2000-591d9f92931745fe8d4e9dd7f4be254d.jpg',
      cookTime: '30 mins',
      category: StringConst.soup,
      rating: 4.6,
      difficulty: 'Easy',
      ingredients: [
        'Button mushrooms',
        'Onion',
        'Garlic',
        'Butter',
        'Flour',
        'Vegetable stock',
        'Cream',
        'Salt and pepper',
      ],
      directions:
          'Sauté onion and garlic in butter, then add mushrooms until soft. Stir in flour, pour stock, and simmer. Blend until smooth, finish with cream, and season to taste.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '10',
      title: 'Chicken Salad',
      description: 'This creamy chicken salad recipe is the best and a family favorite! I like to use leftover roast chicken or baked chicken breasts that have been sprinkled with basil or rosemary. Almonds and celery add a lovely crunch.',
      imagePath: 'https://www.allrecipes.com/thmb/r66sEh0q3DDLRSWCOTQvahgBkF0=/282x188/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8499-Best-Chicken-Salad-DDMFS-3X4-11915-d36a5b98b1e041b3b48b62ecdfa6029e.jpg',
      cookTime: '30 mins',
      category: StringConst.salad,
      rating: 4.5,
      difficulty: 'Easy',
      ingredients: [
        'Firm tofu',
        'Bell peppers',
        'Olive oil',
        'Soy sauce',
        'Garlic',
        'Black pepper',
      ],
      directions:
      'Press and cube the tofu. Toss with oil, soy sauce, and garlic. Roast with peppers until golden and crisp on the edges. Serve warm over greens.',
      isFavorite: true,
    ),

    RecipeModel(
      id: '11',
      title: 'Pasta Salad',
      description: 'This pasta salad is nice and colorful, easy to make, and great for summer picnics or parties. The recipe was given to me by a dear friend many years ago, and I’ve been making it ever since!',
      imagePath: 'https://www.allrecipes.com/thmb/1_ts__qPQ68QuzUO7Mlo4hBpq8A=/282x188/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/14385-pasta-salad-DDMFS-4x3-28eb5dbe00624780b36cabfef15ca183.jpg',
      cookTime: '30 mins',
      category: StringConst.salad,
      rating: 4.5,
      difficulty: 'Easy',
      ingredients: [
        'Firm tofu',
        'Bell peppers',
        'Olive oil',
        'Soy sauce',
        'Garlic',
        'Black pepper',
      ],
      directions:
      'Press and cube the tofu. Toss with oil, soy sauce, and garlic. Roast with peppers until golden and crisp on the edges. Serve warm over greens.',
      isFavorite: true,
    ),

    RecipeModel(
      id: '3',
      title: 'Harvest Pork Stew',
      description: 'A terrific autumn stew, butternut squash and apples add a hint of sweetness to the savory flavors. Make it on the stovetop or in a slow cooker. “The flavor of the butternut and the spices was amazing,” says reviewer chefcheri. “It’s a recipe you can add to or subtract from and make your own!”',
      imagePath: 'https://www.allrecipes.com/thmb/KF2_DCX9q43D_AuDoIb4GHbqauE=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Harvest-Pork-Stew-f5223fe9eb6c47a29680a9a567dbfa88.jpg',
      cookTime: '30 mins',
      category: StringConst.salad,
      rating: 4.5,
      difficulty: 'Easy',
      ingredients: [
        'Firm tofu',
        'Bell peppers',
        'Olive oil',
        'Soy sauce',
        'Garlic',
        'Black pepper',
      ],
      directions:
          'Press and cube the tofu. Toss with oil, soy sauce, and garlic. Roast with peppers until golden and crisp on the edges. Serve warm over greens.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '4',
      title: 'Homemade Beef Stew',
      description: 'A true classic! Seasoned browned beef simmers with onions, carrots, potatoes, and frozen corn. “This was excellent,” raves reviewer MCGLAUNT. “Easiest and best stew I have eaten besides my grandmother’s. I added a can of French cut green beans with the corn.”',
      imagePath: 'https://www.allrecipes.com/thmb/EucBM6UWUL4hjN5bXoj5tp75C5Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/25678-beef-stew-vi-humblepieliving-001-4x3-96b76b098c8642aea824065bce96df7e.jpg',
      cookTime: '10 min',
      category: StringConst.breakfast,
      rating: 4.7,
      difficulty: 'Medium',
      ingredients: [
        'Almond flour',
        'Powdered sugar',
        'Cocoa powder',
        'Egg whites',
        'Granulated sugar',
        'Dark chocolate',
        'Heavy cream',
      ],
      directions:
          'To make Choco Macarons, start by sifting together almond flour, powdered sugar, and cocoa powder to ensure a smooth batter. In a separate bowl, whisk egg whites until foamy, then gradually add granulated sugar while beating until soft peaks form. Gently fold the dry ingredients into the meringue using a spatula until the batter flows like lava.',
      isFavorite: false,
    ),

    RecipeModel(
      id: '12',
      title: 'Pistachio Salad',
      description: 'This pistachio salad is super simple to make with pistachio pudding mix, whipped topping, and marshmallows for a classic dessert. This recipe can be changed to suit your tastes by adding additional fruit or nuts.',
      imagePath: 'https://www.allrecipes.com/thmb/KPkhpk_HsfdWUvvIJp8yuaSSV3w=/282x188/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/14286-instant-pistachio-salad-VAT-Beauty-4x3-f8721cf68565423c9da53b25b499f3ec.jpg',
      cookTime: '30 mins',
      category: StringConst.salad,
      rating: 4.5,
      difficulty: 'Easy',
      ingredients: [
        'Firm tofu',
        'Bell peppers',
        'Olive oil',
        'Soy sauce',
        'Garlic',
        'Black pepper',
      ],
      directions:
      'Press and cube the tofu. Toss with oil, soy sauce, and garlic. Roast with peppers until golden and crisp on the edges. Serve warm over greens.',
      isFavorite: true,
    ),

    RecipeModel(
      id: '13',
      title: 'Caprese Salad with Balsamic Reduction',
      description: 'This caprese salad with tomatoes, fresh mozzarella, and basil is drizzled with a sweet balsamic reduction and olive oil. Easy, impressive, and delicious!',
      imagePath: 'https://www.allrecipes.com/thmb/knrz94hz3kacjTPveyvpqUxKq8w=/282x188/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/AR-228126-caprese-salad-with-balsamic-reduction-ddmfs-2644-4x3-f32ac2b2fb9d4234884a752490fb015b.jpg',
      cookTime: '30 mins',
      category: StringConst.salad,
      rating: 4.5,
      difficulty: 'Easy',
      ingredients: [
        'Firm tofu',
        'Bell peppers',
        'Olive oil',
        'Soy sauce',
        'Garlic',
        'Black pepper',
      ],
      directions:
      'Press and cube the tofu. Toss with oil, soy sauce, and garlic. Roast with peppers until golden and crisp on the edges. Serve warm over greens.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '5',
      title: 'Polish Bean and Sausage Stew Recipe',
      description: 'Cannellini beans, kielbasa sausage, bacon, and tomatoes combine in this filling, satisfying Polish stew that’s ideal for chilly nights in.',
      imagePath: 'https://www.allrecipes.com/thmb/jRfpCk3b6XEkptLBgf4ZvRbRHlg=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4573370-cd333d7813bc404681a0600adb380137.jpg',
      cookTime: '25 mins',
      category: StringConst.salad,
      rating: 4.4,
      difficulty: 'Easy',
      ingredients: [
        'Mixed greens',
        'Grilled chicken',
        'Cherry tomatoes',
        'Cucumber',
        'Olive oil',
        'Lemon juice',
      ],
      directions:
          'Chop greens and vegetables. Slice grilled chicken and toss everything with olive oil and lemon juice. Season and serve chilled.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '6',
      title: 'Award-Winning White Chicken Chili',
      description: '“I took this to a gathering of 8 people, and the Crock Pot was emptied entirely!” says reviewer Holly. “Everyone loved it, and it was super easy.”',
      imagePath: 'https://www.allrecipes.com/thmb/dwvS5KEnu0ZiIJrvQyX-0AF0kk8=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/255245-award-winning-white-chicken-chili-DDMFS-beauty-4x3-f331b9d106064e029b3d3fa40cedc7ee.jpg',
      cookTime: '10 mins',
      category: StringConst.breakfast,
      rating: 4.3,
      difficulty: 'Easy',
      ingredients: [
        'Sourdough bread',
        'Ripe avocado',
        'Lemon',
        'Chili flakes',
        'Salt',
        'Olive oil',
      ],
      directions:
          'Toast the bread until golden. Mash avocado with lemon and salt, spread on toast, and finish with chili flakes and a drizzle of olive oil.',
      isFavorite: true,
    ),
  ];

  static final recipesOfTheWeek = [
    RecipeModel(
      id: '7',
      title: 'Ghormeh Sabzi (Persian Herb Stew)',
      description: 'Ghormeh sabzi is a delicious Persian beef and kidney bean stew loaded with greens and herbs like spinach, cilantro, fenugreek, and parsley. “It’s traditionally served atop white rice (polow),” says marybakes. “You can also serve it with lavash bread.”',
      imagePath: 'https://www.allrecipes.com/thmb/oIBbjuG9rjXDmr5IdFPLM97DOhs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/257499-ghormeh-sabzi-persian-herb-stew-DDMFS-beauty-4x3-BG-2923-0a3327d626ca4b848bd1d1ebd7ca331d.jpg',
      cookTime: '30 mins',
      category: StringConst.soup,
      rating: 4.8,
      difficulty: 'Medium',
      ingredients: [
        'Lemongrass stalks',
        'Kaffir lime leaves',
        'Galangal',
        'Thai chili',
        'Mushrooms',
        'Shrimp or tofu',
        'Fish sauce',
        'Lime juice',
      ],
      directions:
      'Bring stock to a boil with lemongrass, galangal, and lime leaves. Add mushrooms and chili, then simmer. Season with fish sauce and lime juice. Finish with shrimp or tofu and serve hot.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '8',
      title: 'Keema Aloo (Ground Beef and Potatoes)',
      description: '“This keema aloo curry is by far my favorite Indian recipe,” says recipe creator The Meatetarian. “Inspired by my mom, who still makes this for me to this day. If you want to try something a little different, I guarantee you will love this meal.”',
      imagePath: 'https://www.allrecipes.com/thmb/qbOiUnRrbpGlSIDXSqTL8lBSZv8=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/AR-231026-keema-aloo-DDMFS-beauty-4x3-6a2d9117370b4383b8b829c79b539501.jpg',
      cookTime: '30 mins',
      category: StringConst.soup,
      rating: 4.8,
      difficulty: 'Medium',
      ingredients: [
        'Lemongrass stalks',
        'Kaffir lime leaves',
        'Galangal',
        'Thai chili',
        'Mushrooms',
        'Shrimp or tofu',
        'Fish sauce',
        'Lime juice',
      ],
      directions:
      'Bring stock to a boil with lemongrass, galangal, and lime leaves. Add mushrooms and chili, then simmer. Season with fish sauce and lime juice. Finish with shrimp or tofu and serve hot.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '9',
      title: 'Creamy Tuscan Soup',
      description: 'This recipe makes for a hearty, comforting meal that comes together quickly. While traditional Tuscan soups tend to be lighter and more rustic, this version leans richer, with heavy cream, pasta, and sun-dried tomatoes. It’s more of a Tuscan-inspired American comfort dish than an authentic regional recipe.',
      imagePath: 'https://www.allrecipes.com/thmb/0nye41-U0vU8CeSPMLmraCpDsC4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/11680831-tuscan-chicken-soup-recipe-DDMFS-4x3-6848-c0f8e1b324a341acaf167dcd09f15764.jpg',
      cookTime: '30 mins',
      category: StringConst.soup,
      rating: 4.8,
      difficulty: 'Medium',
      ingredients: [
        'Lemongrass stalks',
        'Kaffir lime leaves',
        'Galangal',
        'Thai chili',
        'Mushrooms',
        'Shrimp or tofu',
        'Fish sauce',
        'Lime juice',
      ],
      directions:
      'Bring stock to a boil with lemongrass, galangal, and lime leaves. Add mushrooms and chili, then simmer. Season with fish sauce and lime juice. Finish with shrimp or tofu and serve hot.',
      isFavorite: true,
    ),
  ];

  static List<RecipeModel> get recommendations => recipes.take(3).toList();

  static List<String> get recipeOfTheWeekImages => [
        AssetRes.recipeWeekLeftImg,
        AssetRes.recipeWeekRightImg,
      ];

  static RecipeModel? recipeById(String id) {
    for (final recipe in [...recipes, ...recipesOfTheWeek]) {
      if (recipe.id == id) return recipe;
    }
    return null;
  }

  static List<RecipeModel> recipesByCategory(String category) =>
      recipes.where((recipe) => recipe.category == category).toList();

  static List<RecipeModel> favoriteRecipesByCategory(String category) => recipes
      .where((recipe) => recipe.isFavorite && recipe.category == category)
      .toList();

  static int favoriteCountByCategory(String category) =>
      favoriteRecipesByCategory(category).length;
}
