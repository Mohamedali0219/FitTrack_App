import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/helper/database/database_helper.dart';
import 'package:fit_track_app/core/service/reminder/notification_helper.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/features/reminder/ui/function_reminder_screen.dart';
import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List<Map<String, dynamic>> _reminders = [];

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  Future<void> _loadReminders() async {
    final reminders = await DbHelper.getReminders();
    setState(() {
      _reminders = reminders;
    });
  }

  Future<void> _toggleReminder(int id, bool isActive) async {
    await DbHelper.toggleReminder(id, isActive);
    if (isActive) {
      final reminder = _reminders.firstWhere((rem) => rem[id] == id);
      NotificationHelper.scheduleNotification(id, reminder['title'],
          reminder['category'], DateTime.parse(reminder['reminderTime']));
    } else {
      NotificationHelper.cancelNotification(id);
    }
    _loadReminders();
  }

  Future<void> _deleteReminder(int id) async {
    await DbHelper.deleteReminder(id);
    NotificationHelper.cancelNotification(id);
    _loadReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Reminder",
        isback: true,
        onPressed: () => context.pop(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FunctionReminderScreen(),
            ),
          );
        },
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: ColorsManager.whiteColor,
        child: Icon(Icons.add),
      ),
      body: _reminders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer_off_outlined,
                    size: 48,
                    color: ColorsManager.primaryColor,
                  ),
                  Text(
                    "No Reminders Yet",
                    style: TextStyle(
                        color: ColorsManager.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final reminder = _reminders[index];
                return Dismissible(
                  key: Key(reminder['id'].toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(right: 20.0),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete,
                      color: ColorsManager.whiteColor,
                      size: 30,
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return await _showDeleteConfirmationDialog(context);
                  },
                  onDismissed: (direction) async {
                    _deleteReminder(reminder['id']);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Reminder Deleted Successfully')));
                  },
                  child: Card(
                    color: ColorsManager.primaryColor.withOpacity(0.8),
                    elevation: 6,
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications_none_outlined,
                        color: ColorsManager.primaryColor,
                      ),
                      title: reminder['title'],
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      subtitle: Text(
                        reminder['date'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Switch(
                        value: reminder['isActive'] == 1,
                        onChanged: (value) =>
                            _toggleReminder(reminder['id'], value),
                        activeColor: ColorsManager.primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorsManager.whiteColor,
          title: Text('Delete Reminder'),
          content: Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}
