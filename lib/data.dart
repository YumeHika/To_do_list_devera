class ListItem {
  final String title;
  final String urlImage;

  const ListItem({
    required this.title,
    required this.urlImage,
  });
}

final List<ListItem> listItem = [
  ListItem(
    title: 'Item1',
    urlImage:
        'https://images.unsplash.com/photo-1501183007986-d0d080b147f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80',
  ),
  ListItem(
    title: 'Item2',
    urlImage:
        'https://images.unsplash.com/photo-1501183007986-d0d080b147f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80',
  ),
  ListItem(
    title: 'Item3',
    urlImage:
        'https://images.unsplash.com/photo-1501183007986-d0d080b147f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80',
  ),
];
