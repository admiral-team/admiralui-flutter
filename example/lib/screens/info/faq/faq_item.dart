class FAQItem {
  FAQItem({
    required this.title,
    required this.subtitle,
    this.isExpanded = false,
  });
  final String title;
  final String subtitle;
  bool isExpanded;
}
