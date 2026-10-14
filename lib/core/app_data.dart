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
      title: 'Spicy Thai Tom Yum',
      description: 'A tangy and spicy Thai soup...',
      imagePath: AssetRes.spicyThaiTomyumImg,
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
      title: 'Creamy Mushroom Soup',
      description: 'A warm, velvety soup made...',
      imagePath: AssetRes.creamyMushroomSoupImg,
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
      id: '3',
      title: 'Roasted Tofu',
      description: 'Simple, fresh, and bright...',
      imagePath: AssetRes.roastedTofuImg,
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
      title: 'Choco Macarons',
      description:
          'Choco Macarons are a delightful blend of dessert. These choco shells are filled with creamy ganache...',
      imagePath: AssetRes.chocoMacaronsImg,
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
      id: '5',
      title: 'Garden Chicken Salad',
      description: 'Crisp greens with tender chicken...',
      imagePath: AssetRes.recipeWeekLeftImg,
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
      title: 'Avocado Toast',
      description: 'Creamy avocado on crisp toast...',
      imagePath: AssetRes.avocadoToastImg,
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
    RecipeModel(
      id: '7',
      title: 'Herb Breakfast Bowl',
      description: 'A bright morning bowl of herbs...',
      imagePath: AssetRes.recipeWeekRightImg,
      cookTime: '20 mins',
      category: StringConst.breakfast,
      rating: 4.2,
      difficulty: 'Easy',
      ingredients: [
        'Eggs',
        'Fresh herbs',
        'Tomato',
        'Olive oil',
        'Salt',
        'Pepper',
      ],
      directions:
          'Cook eggs to your liking. Chop herbs and tomato, plate with eggs, and drizzle with olive oil. Season and serve immediately.',
      isFavorite: false,
    ),
    RecipeModel(
      id: '8',
      title: 'Miso Glazed Tofu Bowl',
      description: 'Savory tofu with fresh greens...',
      imagePath: AssetRes.roastedTofuImg,
      cookTime: '35 mins',
      category: StringConst.mainDish,
      rating: 4.6,
      difficulty: 'Medium',
      ingredients: [
        'Firm tofu',
        'Miso paste',
        'Rice',
        'Greens',
        'Sesame oil',
        'Green onion',
      ],
      directions:
          'Press tofu and coat with miso glaze. Bake until caramelized. Serve over rice with greens and sesame oil.',
      isFavorite: true,
    ),
    RecipeModel(
      id: '9',
      title: 'Classic Tomato Soup',
      description: 'Comforting soup with fresh basil...',
      imagePath: AssetRes.creamyMushroomSoupImg,
      cookTime: '35 mins',
      category: StringConst.soup,
      rating: 4.5,
      difficulty: 'Easy',
      ingredients: [
        'Tomatoes',
        'Onion',
        'Garlic',
        'Vegetable stock',
        'Basil',
        'Cream',
      ],
      directions:
          'Simmer tomatoes with onion and garlic in stock. Blend until smooth, stir in cream and basil, and season to taste.',
      isFavorite: false,
    ),
    RecipeModel(
      id: '10',
      title: 'Citrus Greens Salad',
      description: 'Zesty greens with citrus dressing...',
      imagePath: AssetRes.recipeWeekLeftImg,
      cookTime: '15 mins',
      category: StringConst.salad,
      rating: 4.1,
      difficulty: 'Easy',
      ingredients: [
        'Mixed greens',
        'Orange segments',
        'Feta',
        'Olive oil',
        'Lemon juice',
        'Honey',
      ],
      directions:
          'Whisk oil, lemon, and honey for dressing. Toss greens with citrus and feta, then dress lightly before serving.',
      isFavorite: true,
    ),
  ];

  static List<RecipeModel> get recommendations => recipes.take(3).toList();

  static List<String> get recipeOfTheWeekImages => [
        AssetRes.recipeWeekLeftImg,
        AssetRes.recipeWeekRightImg,
      ];

  static RecipeModel? recipeById(String id) {
    for (final recipe in recipes) {
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
