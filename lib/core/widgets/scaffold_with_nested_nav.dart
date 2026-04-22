import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_task/gen/assets.gen.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const ScaffoldWithNestedNavigation({super.key, required this.navigationShell});

  @override
  State<ScaffoldWithNestedNavigation> createState() => _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState extends State<ScaffoldWithNestedNavigation> {
  int _currentIndex = 0;

  void onTapBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.navigationShell,
          Align(
            alignment: .bottomCenter,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 84,
                  ),
                  child: Material(
                    color: theme.colorScheme.surface,
                    borderRadius: .circular(16),
                    clipBehavior: Clip.antiAlias,
                    child: Ink(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: .horizontal(left: .circular(16)),
                              onTap: () {
                                onTapBottomBar(0);
                              },
                              child: Center(
                                child: Assets.icons.news.svg(
                                  colorFilter: ColorFilter.mode(
                                    _currentIndex == 0 ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                                    .srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              borderRadius: .horizontal(right: .circular(16)),
                              onTap: () {
                                onTapBottomBar(1);
                              },
                              child: Center(
                                child: Assets.icons.newsFavorites.svg(
                                  colorFilter: ColorFilter.mode(
                                    _currentIndex == 1 ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                                    .srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
