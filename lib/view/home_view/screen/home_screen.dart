import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quirky/core/constants/theme.dart';
import 'package:quirky/logic/task_notifier_provider.dart';
import 'package:quirky/model/task_model.dart';
import 'package:quirky/view/home_view/widget/add_screen_modal.dart';
import 'package:quirky/view/home_view/widget/setting_screen_modal.dart';
import 'package:quirky/view/home_view/widget/task_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    final todayTasks = tasks.where((task) => task.isSomeDay == 'today').toList();
    final somedayTasks = tasks.where((task) => task.isSomeDay == 'someday').toList();


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quirky',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: quirkyTheme.scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                _buildIconButton(
                  icon: HugeIcons.strokeRoundedAdd01,
                  onPressed: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const AddScreenModal(),
                    );
                  },
                ),
                const SizedBox(width: 10),
                _buildIconButton(
                  icon: HugeIcons.strokeRoundedSettings01,
                  onPressed: () {
                     showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const SettingScreenModal(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      ///
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionLabel(
              icon: HugeIcons.strokeRoundedCalendar02,
              title: 'Today',
            ),
            const SizedBox(height: 20),

            _buildScrollableTaskContainer(todayTasks, ref),

            const SizedBox(height: 30),
            _buildSectionLabel(
              icon: HugeIcons.strokeRoundedCalendar02,
              title: 'Someday',
            ),
            const SizedBox(height: 20),
            _buildScrollableTaskContainer(somedayTasks, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: HugeIcon(
          icon: icon,
          color: Colors.black.withOpacity(0.6),
          size: 25,
        ),
      ),
    );
  }

  Widget _buildSectionLabel({
    required IconData icon,
    required String title
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HugeIcon(icon: icon, color: Colors.black.withOpacity(0.6), size: 25),
        const SizedBox(width: 10),
        Text(title, style: quirkyTheme.textTheme.titleLarge),
      ],
    );
  }

  Widget _buildScrollableTaskContainer(List<TaskModel> tasks, ref) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scrollbar(
          thickness: 0,
          radius: const Radius.circular(20),
          child: ListView.separated(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCardWidget(
                task: task,
                onTap: () { ref.read(taskListProvider.notifier).toggleTask(task.id); },
                onDelete: () { ref.read(taskListProvider.notifier).deleteTask(task.id); },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 15),
          ),
        ),
      ),
    );
  }
}
