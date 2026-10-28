enum LayoutTab { home, friends, journey, profile }

class LayoutState {
  const LayoutState({this.tab = LayoutTab.home});

  final LayoutTab tab;
}
