part of 'widget.dart';

class TroubleReportItemWidget extends StatelessWidget {
  final TroubleReport troubleReport;
  final VoidCallback? onTap;
  final bool? showStatus;
  final bool? showDownload;
  final String? pathFile;

  const TroubleReportItemWidget({
    super.key,
    required this.troubleReport,
    this.onTap,
    this.showStatus,
    this.showDownload,
    this.pathFile,
  });

  @override
  Widget build(BuildContext context) {
    return CompanyCardWidget(
      image: "assets/pertamina.png",
      name: troubleReport.company!.name.toString(),
      address: troubleReport.company!.address.toString(),
      showStatus: showStatus,
      // status: troubleReport.status.toString(),
      showDownload: showDownload,
      pathFile: pathFile,
      onTap: onTap,
    );
  }
}
