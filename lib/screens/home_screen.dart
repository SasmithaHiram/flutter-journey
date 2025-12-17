import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Welcome back 👋',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: color.primaryContainer,
              child: Text(
                'S',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: color.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SearchBar(),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: StatCard(
                            title: 'Projects',
                            value: '12',
                            icon: Icons.folder_open_rounded,
                            gradient: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            title: 'Tasks',
                            value: '34',
                            icon: Icons.check_circle_rounded,
                            gradient: [Color(0xFF34D399), Color(0xFFA7F3D0)],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Expanded(
                          child: StatCard(
                            title: 'Messages',
                            value: '5',
                            icon: Icons.chat_bubble_rounded,
                            gradient: [Color(0xFFFF8A65), Color(0xFFFFCCBC)],
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            title: 'Revenue',
                            value: '\$8.2k',
                            icon: Icons.trending_up_rounded,
                            gradient: [Color(0xFF9C27B0), Color(0xFFE1BEE7)],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SectionHeader(title: 'Quick Actions'),
                    const SizedBox(height: 12),
                    GridView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.85,
                          ),
                      children: const [
                        QuickActionButton(
                          icon: Icons.add_task_rounded,
                          label: 'New Task',
                        ),
                        QuickActionButton(
                          icon: Icons.event_rounded,
                          label: 'Schedule',
                        ),
                        QuickActionButton(
                          icon: Icons.attach_money_rounded,
                          label: 'Invoice',
                        ),
                        QuickActionButton(
                          icon: Icons.group_rounded,
                          label: 'Clients',
                        ),
                        QuickActionButton(
                          icon: Icons.file_present_rounded,
                          label: 'Docs',
                        ),
                        QuickActionButton(
                          icon: Icons.analytics_rounded,
                          label: 'Reports',
                        ),
                        QuickActionButton(
                          icon: Icons.chat_rounded,
                          label: 'Chat',
                        ),
                        QuickActionButton(
                          icon: Icons.settings_rounded,
                          label: 'Settings',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SectionHeader(title: 'Recent Activity'),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                final items = _mockActivities;
                if (index >= items.length) return null;
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 6,
                  ),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 2,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.primary.withOpacity(
                          0.1,
                        ),
                        child: Icon(
                          item.icon,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      title: Text(
                        item.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        item.subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: Text(
                        item.time,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline_rounded),
            selectedIcon: Icon(Icons.work_rounded),
            label: 'Projects',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_month_rounded),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.white,
      elevation: 0,
      borderRadius: BorderRadius.circular(14),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search projects, tasks, clients...',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
          prefixIcon: const Icon(Icons.search_rounded),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

class _ActivityItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}

const _mockActivities = <_ActivityItem>[
  _ActivityItem(
    icon: Icons.check_circle_rounded,
    title: 'Task completed',
    subtitle: 'Onboard flow mockups - Sprint 12',
    time: '2m ago',
  ),
  _ActivityItem(
    icon: Icons.folder_open_rounded,
    title: 'New project created',
    subtitle: 'Marketing Website Revamp',
    time: '25m ago',
  ),
  _ActivityItem(
    icon: Icons.mail_rounded,
    title: 'Message from Alex',
    subtitle: 'Reviewed your proposal, looks great!',
    time: '1h ago',
  ),
  _ActivityItem(
    icon: Icons.event_rounded,
    title: 'Meeting scheduled',
    subtitle: 'Client sync - Thu 10:00 AM',
    time: '3h ago',
  ),
  _ActivityItem(
    icon: Icons.attach_money_rounded,
    title: 'Invoice paid',
    subtitle: 'INV-2051 - 1,250.00',
    time: 'Yesterday',
  ),
];
