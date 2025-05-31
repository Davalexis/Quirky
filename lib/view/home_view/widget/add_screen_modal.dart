import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:quirky/core/constants/theme.dart';
import 'package:quirky/logic/task_notifier_provider.dart';

class AddScreenModal extends ConsumerStatefulWidget {
  const AddScreenModal({super.key});

  @override
  ConsumerState<AddScreenModal> createState() => _AddScreenModalState();
}

class _AddScreenModalState extends ConsumerState<AddScreenModal> {
  final TextEditingController _taskController = TextEditingController();

  String _selectedType = 'today';

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: quirkyTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),

      child: Column(
        children: [
          SizedBox(height: 30),

          Text('Create New Task', style: quirkyTheme.textTheme.titleLarge),

          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: _taskController,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 20,
              ),
              cursorWidth: 2,
              cursorColor: Colors.black.withOpacity(0.6),
              cursorHeight: 30,
              decoration: InputDecoration(
                hintText: ' Create Task',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 20,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              spacing: 10,
              children: [
                _buildTypeSelectorButton('today'),

                _buildTypeSelectorButton('someday'),
              ],
            ),
          ),

          Image.asset('assets/images/Add files-pana.png', fit: BoxFit.cover),
          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                elevation: 0,
              ),
              onPressed: () {
                final taskTitle = _taskController.text.trim();
                if (taskTitle.isNotEmpty) {
                  ref
                      .read(taskListProvider.notifier)
                      .addTask(
                        taskTitle,
                        isSomeDay: _selectedType == 'someday',
                      );
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 100,
                ),
                child: Center(
                  child: Text(
                    'Add Task',
                    style: quirkyTheme.textTheme.titleLarge,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}

extension on _AddScreenModalState {
  Widget _buildTypeSelectorButton(String type) {
    final isSelected = _selectedType == type;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedType = type;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            border:
                isSelected
                    ? null
                    : Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 1,
                    ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Text(
            type == 'today' ? 'Today' : 'Someday',
            style: TextStyle(
              color:
                  isSelected
                      ? Colors.black.withOpacity(0.7)
                      : Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
