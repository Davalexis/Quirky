import 'package:flutter/material.dart';
import 'package:quirky/core/constants/theme.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../model/task_model.dart';

class TaskCardWidget extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const TaskCardWidget({
    super.key,
    required this.task,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Dismissible(
        key: Key(task.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedDelete01,
            color: Colors.red,
            size: 20,
          ),
        ),
        onDismissed: (_) => onDelete?.call(),
        child: Material(
          borderRadius: BorderRadius.circular(25),
          color: quirkyTheme.scaffoldBackgroundColor,
          child: ListTile(
            onTap: onTap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            leading: HugeIcon(
              icon: task.isCompleted
                  ? HugeIcons.strokeRoundedCheckList
                  : HugeIcons.strokeRoundedCheckList, // TODO: You can update icon based on state
              color: Colors.black.withOpacity(0.6),
              size: 25,
            ),
            title: Text(
              task.title,
              style: quirkyTheme.textTheme.bodyLarge!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            trailing: onDelete != null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Center(
                      child: IconButton(
                        onPressed: onDelete,
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowTurnDown,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
