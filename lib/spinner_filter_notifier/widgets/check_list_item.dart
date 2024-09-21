part of '../spinner_filter.dart';

class _CheckListItem extends StatelessWidget {
  const _CheckListItem({
    required this.name,
    required this.isSelect,
    this.isMulti = false,
  });

  final String name;
  final bool isSelect;
  final bool isMulti;

  @override
  Widget build(BuildContext context) {
    final theme = SpinnerBoxTheme.of(context).column;

    Widget icon = isSelect
        ? (theme.icon1 ?? Assets.name('single_select'))
        : (theme.icon2 ?? const SizedBox());
    if (isMulti) {
      icon = isSelect
          ? (theme.iconMulti1 ?? Assets.name('muti_select'))
          : (theme.iconMulti2 ?? Assets.name('muti_unselect'));
    }
    var emptyBoxDecoration = const BoxDecoration();
    return SizedBox(
      height: theme.height,
      child: DecoratedBox(
        decoration: isSelect
            ? theme.selectedDecoration ?? emptyBoxDecoration
            : theme.unselectedDecoration ?? emptyBoxDecoration,
        child: Padding(
          padding: theme.padding,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: isSelect ? theme.selectedStyle : theme.unselectedStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: theme.maxLine,
                ),
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
