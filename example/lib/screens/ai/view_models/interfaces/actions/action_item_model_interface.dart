abstract class ActionItemModelInterface {
  ActionItemModelInterface({
    required this.type,
    required this.actionName
  });

  final String type;
  final String actionName;
}