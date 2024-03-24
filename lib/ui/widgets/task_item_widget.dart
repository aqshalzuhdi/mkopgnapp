part of 'widget.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final bool? showStatus;
  final bool? showDownload;
  final String? pathFile;
  const TaskItemWidget({
    super.key,
    required this.task,
    this.onTap,
    this.showStatus,
    this.showDownload,
    this.pathFile,
  });

  @override
  Widget build(BuildContext context) {
    return CompanyCardWidget(
      image: "assets/pertamina.png",
      name: task.company!.name.toString(),
      address: task.company!.address.toString(),
      showStatus: showStatus,
      status: task.status.toString(),
      showDownload: showDownload,
      pathFile: pathFile,
      onTap: onTap,
    );
  }
}
