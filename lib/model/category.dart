class Category {
  final String icon, title;

  Category({required this.icon, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/icons/hamburger.png",
    title: "Hamburger",
  ),
  Category(
    icon: "assets/icons/pizza.png",
    title: "Pizza",
  ),
  Category(
    icon: "assets/icons/coffee-cup.png",
    title: "Coffee",
  ),

];